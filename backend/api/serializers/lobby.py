from rest_framework import serializers
from api.models.lobby import Lobby


class LobbySerializer(serializers.ModelSerializer):
    class Meta:
        model = Lobby
        fields = [
            "id",
            "targetLocationLat",
            "targetLocationLong",
            "targetLocationAddressFormat",
            "limitMembers",
            "createdAt",
            "name"
        ]
            
        
    
class LobbyCreateSerializer(serializers.Serializer):
    targetLocationLat = serializers.FloatField(required=True)
    targetLocationLong = serializers.FloatField(required=True)
    targetLocationAddressFormat = serializers.CharField(max_length=255, required=True)
    limitMembers = serializers.IntegerField(required=True)
    createdAt = serializers.DateTimeField(required=True)
    name = serializers.CharField(max_length=255, required=True)

    def validate_name(self, value):
        if Lobby.objects.filter(name=value).exists():
            raise serializers.ValidationError("Username already exists")
