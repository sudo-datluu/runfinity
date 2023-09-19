import array
import random
import traceback

from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import permissions

from api.models import Lobby, History, Runner
from api.serializers.lobby import LobbySerializer, LobbyCreateSerializer
from api.serializers.history import HistorySerializer

from .const import RESPONSE_NOT_FOUND, RESPONSE_FORBIDDEN, get_bad_request, get_random_lat_long_within_range
import traceback
import random

class LobbyGetAll(APIView):
    def get(self, request):
        try:
            lobbies = Lobby.objects.all()
            serializer = LobbySerializer(lobbies, many=True)
            return Response(serializer.data)
        except Lobby.DoesNotExist:
            return RESPONSE_NOT_FOUND

class LobbyGet(APIView):
    def get(self, request, lobby_id):
        try:
            lobby = Lobby.objects.get(id=lobby_id)
            serializer = LobbySerializer(lobby)
            return Response(serializer.data)
        except Lobby.DoesNotExist:
            return RESPONSE_NOT_FOUND

class LobbyStart(APIView):
    permission_classes = [permissions.IsAuthenticated]
    def post(self, request,lobby_id):
        try:
            lobby = Lobby.objects.get(id=lobby_id)
            runner = Runner.objects.filter(username=request.user.username).first()
            if lobby.started:
                return get_bad_request("Lobby have already started")
            lobby.started = True
            lobby.save()
            if not runner or lobby.owner != runner:
                return RESPONSE_FORBIDDEN
            for memberID in lobby.currentMemberID:
                member = Runner.objects.get(id=memberID)
                if not member: continue
                history = History(
                    lobby=lobby,
                    runner=member,
                    maxBPM=0,
                    latTracks=[],
                    longTracks=[],
                    bpmArray=[]
                )
                history.save()
            serializer = LobbySerializer(lobby)
            return Response(serializer.data)
        except Lobby.DoesNotExist:
            return RESPONSE_NOT_FOUND

class LobbyCreate(APIView):
    permission_classes = [permissions.IsAuthenticated]
    def post(self, request):
        serializer = LobbyCreateSerializer(data=request.data)
        runner = Runner.objects.filter(username=request.user.username).first()
        if not runner:
            return RESPONSE_FORBIDDEN
        if serializer.is_valid():
            targetLocationLat = request.data.get("targetLocationLat")
            targetLocationLong = request.data.get("targetLocationLong")
            targetLocationAddressFormat = request.data.get("targetLocationAddressFormat")
            limitMembers = request.data.get("limitMembers")
            name = request.data.get("name")
            currentMemberID = [runner.id]

            lobby = Lobby(
                owner=runner,
                targetLocationLat=targetLocationLat, 
                targetLocationLong=targetLocationLong,
                targetLocationAddressFormat=targetLocationAddressFormat,
                limitMembers=limitMembers,
                currentMembers=1,
                currentMemberID=currentMemberID,
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
    permission_classes = [permissions.IsAuthenticated]
    def post(self, request, lobby_id):
        
        try:
            runner = Runner.objects.filter(username=request.user.username).first()
            if not runner:
                return RESPONSE_FORBIDDEN
            lobby = Lobby.objects.get(id=lobby_id)
            if (lobby.currentMembers >= lobby.limitMembers):
                return get_bad_request("Lobby is full")
            if runner.id in lobby.currentMemberID:
                return get_bad_request("This user have already joined!")
            if lobby.started:
                return get_bad_request("This lobby has been started")
            lobby.currentMembers += 1
            lobby.currentMemberID.append(runner.id)
            lobby.save()

            serializer = LobbySerializer(lobby)
            return Response(serializer.data)
        except Lobby.DoesNotExist:
            return RESPONSE_NOT_FOUND
          
class LobbyLeft(APIView):
    permission_classes = [permissions.IsAuthenticated]
    def post(self, request, lobby_id):
        try:
            lobby = Lobby.objects.get(id=lobby_id)
            runner = Runner.objects.filter(username=request.user.username).first()
            if not runner:
                return RESPONSE_FORBIDDEN
            if runner.id in lobby.currentMemberID:
                lobby.currentMemberID.remove(runner.id)
                lobby.currentMembers -= 1
            else:
                return get_bad_request("This user have not joined this lobby")
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
            if lobby.ended:
                errors.append("Lobby has been ended")
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
