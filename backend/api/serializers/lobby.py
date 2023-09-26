from rest_framework import serializers
from api.models.lobby import Lobby


class LobbySerializer(serializers.ModelSerializer):
    owner = serializers.SerializerMethodField()

    def get_owner(self, obj):
        return obj.owner.email
    class Meta:
        model = Lobby
        fields = [
            "id",
            "owner",
            "targetLocationLat",
            "targetLocationLong",
            "targetLocationAddressFormat",
            "limitMembers",
            "currentMembers",
            "currentMemberID",
            "createdAt",
            "name",
            "ended",
            "started"
        ]
            
        
    
class LobbyCreateSerializer(serializers.Serializer):
    targetLocationLat = serializers.FloatField(required=True)
    targetLocationLong = serializers.FloatField(required=True)
    targetLocationAddressFormat = serializers.CharField(max_length=255, required=True)
    limitMembers = serializers.IntegerField(required=True)
    currentMembers = serializers.IntegerField(required=False)
    currentMemberID = serializers.ListField(child=serializers.IntegerField(required=False), required=False)
    createdAt = serializers.DateTimeField(required=True)
    name = serializers.CharField(max_length=255, required=True)

    def validate_name(self, value):
        if Lobby.objects.filter(name=value).exists():
            raise serializers.ValidationError("Username already exists")
