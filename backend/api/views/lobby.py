from rest_framework.response import Response
from rest_framework.views import APIView

from api.models.lobby import Lobby
from api.serializers.lobby import LobbySerializer, LobbyCreateSerializer

from .const import RESPONSE_NOT_FOUND, get_bad_request


class LobbyGetAll(APIView):
    def get(self, request):
        try:
            lobbies = Lobby.objects.all()
            serializer = LobbySerializer(lobbies, many=True)
            return Response(serializer.data)
        except Lobby.DoesNotExist:
            return RESPONSE_NOT_FOUND

class LobbyGet(APIView):
    def post(self, request):
        name = request.data.get("name")
        try:
            lobby = Lobby.objects.get(name=name)
            serializer = LobbySerializer(lobby)
            return Response(serializer.data)
        except Lobby.DoesNotExist:
            return RESPONSE_NOT_FOUND


class LobbyCreate(APIView):
    def post(self, request):
        serializer = LobbyCreateSerializer(data=request.data)
        if serializer.is_valid():
            targetLocationLat = request.data.get("targetLocationLat")
            targetLocationLong = request.data.get("targetLocationLong")
            targetLocationAddressFormat = request.data.get("targetLocationAddressFormat")
            limitMembers = request.data.get("limitMembers")
            createdAt = request.data.get("createdAt")
            name = request.data.get("name")

            lobby = Lobby(targetLocationLat=targetLocationLat, 
                            targetLocationLong=targetLocationLong,
                            targetLocationAddressFormat=targetLocationAddressFormat,
                            limitMembers=limitMembers,
                            currentMembers=1,
                            createdAt=createdAt,
                            name=name,)
            lobby.save()
            
            serializer = LobbySerializer(lobby)
            return Response(serializer.data)
        else:
            return get_bad_request(msg=serializer.errors)  
        
class LobbyJoin(APIView):
    def post(self, request):
        id = request.data.get('id')
        try:
            lobby = Lobby.objects.get(id=id)
            if (lobby.currentMembers >= lobby.limitMembers):
                return "Lobby is full"
            
            lobby.currentMembers += 1
            lobby.save()

            serializer = LobbySerializer(lobby)
            return Response(serializer.data)
        except Lobby.DoesNotExist:
            return RESPONSE_NOT_FOUND


