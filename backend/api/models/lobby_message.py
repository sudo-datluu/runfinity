from django.db import models

from api.models.runner import Runner

class LobbyMessage(models.Model):
    text = models.CharField(max_length=255)
    user = models.ForeignKey(Runner, on_delete=models.CASCADE)
    createdAt = models.DateTimeField(auto_now_add=True)