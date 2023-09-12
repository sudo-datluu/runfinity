from rest_framework import serializers
from api.models.lobby_message import LobbyMessage

class LobbyChatSerializer(serializers.ModelSerializer):
    class Meta:
        model = LobbyMessage
        fields = '__all__'