from rest_framework.response import Response
from rest_framework.views import APIView

from api.models.lobby import Lobby
from api.serializers.lobby import LobbySerializer, LobbyCreateSerializer

from .const import get_bad_request

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
                            createdAt=createdAt,
                            name=name)
            lobby.save()
            
            serializer = LobbySerializer(lobby)
            return Response(serializer.data)
        else:
            return get_bad_request(msg=serializer.errors)  


