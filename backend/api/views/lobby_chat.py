from requests import Response
from rest_framework.views import APIView
from api.models.lobby_message import LobbyMessage

from api.serializers.lobby_chat import LobbyChatSerializer
from .const import get_bad_request


class GetAllLobbyMessages(APIView):
    def get(self, request):
        # Retrieve all messages
        messages = LobbyMessage.objects.all()

        serializer = LobbyChatSerializer(messages, many=True)

        print(serializer)

        return Response(serializer.data)
    

class PostLobbyMessage(APIView):
    def post(self, request, format=None):
        serializer = LobbyChatSerializer(data=request.data)

        if serializer.is_valid():
            # Assign the sender to the authenticated user
            serializer.validated_data['sender'] = request.user.runner

            serializer.save()

            return Response(serializer.data)
        return get_bad_request(msg=serializer.errors)