from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework import status, permissions
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from django.contrib.auth import authenticate

from api.models.runner import Runner
from api.serializers import RunnerSignUpSerializer, RunnerSerializer

from .const import RESPONSE_FORBIDDEN, RESPONSE_NOT_FOUND, get_bad_request
 
'''
Sign up for new runner
'''
class RunnerSignUp(APIView):
    def post(self, request):
        serializer = RunnerSignUpSerializer(data=request.data)
        if serializer.is_valid():
            username = request.data.get('username')
            password = request.data.get('password')
            fullname = request.data.get('fullname')

            runner = Runner(username=username, email=username)
            runner.fullname = fullname
            runner.set_password(password)
            
            runner.save()
            serializer = RunnerSerializer(runner)
            return Response(serializer.data)
        else:
            return get_bad_request(msg=serializer.errors)

'''
User Login
'''
class Login(APIView):
    def post(self, request):
        username = request.data.get('username')
        password = request.data.get('password')
        try:
            user = Runner.objects.get(username=username)
            if authenticate(
                request=request,
                username=username,
                password=password
            ) and user:
                refreshToken = RefreshToken.for_user(user)
                accessToken = refreshToken.access_token
                tokenData = {
                    'refresh': str(refreshToken),
                    'access': str(accessToken)
                }
                serializer = RunnerSerializer(user)
                return Response(
                    serializer.data | tokenData
                )
            else:
                return RESPONSE_FORBIDDEN
        except Runner.DoesNotExist:
            return RESPONSE_NOT_FOUND

'''
Get My Profile
The request must provide jwt_token in the request header
'''
class RunnerProfile(APIView):
    permission_classes = [permissions.IsAuthenticated]
    def get(self, request, format=None):
        try:
            runner = Runner.objects.filter(username=request.user.username).first()
            if not runner:
                return RESPONSE_FORBIDDEN
            serializer = RunnerSerializer(runner)
            return Response(serializer.data)
        except Runner.DoesNotExist:
            return RESPONSE_NOT_FOUND
            