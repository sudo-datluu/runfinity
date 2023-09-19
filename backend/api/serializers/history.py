from api.models import History
from rest_framework import serializers

class HistorySerializer(serializers.ModelSerializer):
    lobby_id = serializers.SerializerMethodField()
    runner_email = serializers.SerializerMethodField()
    kilometers = serializers.SerializerMethodField()

    def get_kilometers(self, obj):
        return round(obj.steps * 0.672 / 1000, 2)
    
    def get_lobby_id(self, obj):
        return obj.lobby.id
    
    def get_runner_email(self, obj):
        return obj.runner.email

    class Meta:
        model = History
        fields = [
            "id",
            "lobby_id",
            "runner_email",
            "latTracks",
            "longTracks",
            "createdAt",
            "endedAt",
            "maxBPM",
            "bpmArray",
            "steps",
            "caloriesBurned",
            "ptsEarned",
            "expEarned",
            "kilometers"
        ]