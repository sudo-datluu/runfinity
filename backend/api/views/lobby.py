import array
import random
import traceback

from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import permissions

from api.models import Runner, Lobby, History
from api.serializers.lobby import LobbySerializer, LobbyCreateSerializer
from api.serializers import HistorySerializer

from .const import RESPONSE_FORBIDDEN, RESPONSE_NOT_FOUND, get_bad_request, get_random_lat_long_within_range


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
            currentMemberID = array.array(request.data.get("currentMemberID"))

            lobby = Lobby(targetLocationLat=targetLocationLat, 
                            targetLocationLong=targetLocationLong,
                            targetLocationAddressFormat=targetLocationAddressFormat,
                            limitMembers=limitMembers,
                            currentMembers=1,
                            currentMemberID=currentMemberID,
                            createdAt=createdAt,
                            name=name,)
            lobby.save()
            
            serializer = LobbySerializer(lobby)
            return Response(serializer.data)
        else:
            return get_bad_request(msg=serializer.errors)  
        
class LobbyDeleteAll(APIView):
    def delete(self, request):
        try:
            Lobby.objects.all().delete()
            return Response("Delete all lobies")
        except Lobby.DoesNotExist:
            return RESPONSE_NOT_FOUND
        
class LobbyJoin(APIView):
    def post(self, request):
        id = request.data.get('id')
        memberID = request.data.get('memberID')
        try:
            lobby = Lobby.objects.get(id=id)
            if (lobby.currentMembers >= lobby.limitMembers):
                return "Lobby is full"
            
            lobby.currentMembers += 1
            lobby.currentMemberID.append(memberID)
            lobby.save()

            serializer = LobbySerializer(lobby)
            return Response(serializer.data)
        except Lobby.DoesNotExist:
            return RESPONSE_NOT_FOUND

'''
User run in a lobby
'''
class RunInLobby(APIView):
    permission_classes = [permissions.IsAuthenticated]
    def post(self, request, lobby_id,format=None):
        errors = []
        try:
            throwException = False
            runner = Runner.objects.filter(username=request.user.username).first()
            if not runner:
                errors.append("Fail to verify runner")
                throwException = True
            lobby = Lobby.objects.get(id=lobby_id)
            if not lobby:
                errors.append("Lobby does not exist")
                throwException = True
            if throwException: raise Exception
            history = History.objects.filter(lobby=lobby, runner=runner).first()
            if not history:
                errors.append("User have not joined this lobby")
                raise Exception
            
            if request.data.get("dev_mode"):
                new_lat, new_long = get_random_lat_long_within_range(target_lat=history.latTracks[-1], target_long=history.longTracks[-1])
                history.latTracks.append(new_lat)
                history.longTracks.append(new_long)
                new_bpm = random.randint(127, 154)
                history.bpmArray.append(new_bpm)
                history.maxBPM = max(history.maxBPM, new_bpm)
                steps_earned = random.randint(556, 1098)
                history.steps += steps_earned
                caloriesBurned = int(.04*steps_earned)
                history.caloriesBurned += caloriesBurned
                history.ptsEarned += caloriesBurned
                history.expEarned += caloriesBurned
            else:
                history.latTracks.append(request.new_lat)
                history.longTracks.append(request.new_long)
                history.bpmArray.append(request.new_bpm)
                history.maxBPM = max(history.maxBPM, request.new_bpm)
                history.steps += request.steps_earned
                caloriesBurned = int(.04*steps_earned)
                history.caloriesBurned += caloriesBurned
                history.ptsEarned += caloriesBurned
                history.expEarned += caloriesBurned
            history.save()
            s = HistorySerializer(history)
            return Response(s.data)
        except Exception:
            if traceback.format_exc():
                errors.append(traceback.format_exc())
            return get_bad_request(errors)
