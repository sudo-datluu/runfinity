from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import permissions

from django.contrib.auth import authenticate
from api.models import Runner, History
from api.serializers import HistorySerializer

from .const import RESPONSE_NOT_FOUND, get_bad_request, RESPONSE_FORBIDDEN

'''
Get current user history
'''
class GetUserHistory(APIView):
    permission_classes = [permissions.IsAuthenticated]
    def get(self, request):
        try:
            runner = Runner.objects.filter(username=request.user.username).first()
            if not runner:
                return RESPONSE_FORBIDDEN
            histories = History.objects.filter(runner=runner)
            serializer = HistorySerializer(histories, many=True)

            return Response(serializer.data)
        except Runner.DoesNotExist:
            return RESPONSE_NOT_FOUND
