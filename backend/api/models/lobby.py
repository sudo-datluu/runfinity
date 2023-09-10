from api.models import Runner
from django.db import models
from django.contrib.postgres.fields import ArrayField
from django.utils.translation import gettext_lazy as _

class Lobby(models.Model):
    class Meta:
        db_table = 'lobby'
        verbose_name = _('Lobby')
        verbose_name_plural = _('Lobbies')

    targetLocationLat = models.FloatField()
    targetLocationLong = models.FloatField()
    targetLocationAddressFormat = models.TextField()
    limitMembers = models.PositiveSmallIntegerField()
    currentMembers = models.PositiveSmallIntegerField()
    createdAt = models.DateTimeField(auto_now_add=True)
    name = models.TextField()
    
    def __str__(self) -> str:
        return self.name

class History(models.Model):
    lobby = models.ForeignKey(Lobby, on_delete=models.CASCADE)
    runner = models.ForeignKey(Runner, on_delete=models.CASCADE)
    latTracks = ArrayField(models.FloatField(), blank=True)
    longTracks = ArrayField(models.FloatField(), blank=True)
    createdAt = models.DateTimeField(auto_now_add=True)
    endedAt = models.DateTimeField()
    maxBPM = models.FloatField()
    bpmArray = ArrayField(models.FloatField(), blank=True) 
    steps = models.PositiveIntegerField(default=0)
    caloriesBurned = models.PositiveIntegerField(default=0) 
    ptsEarned = models.PositiveIntegerField(default=0)
    expEarned = models.PositiveIntegerField(default=0)
    
    class Meta:
        db_table = 'history'
        verbose_name = _('History')
        verbose_name_plural = _('Histories')

    def __str__(self) -> str:
        return self.lobby.__str__() + "-" + self.runner.__str__()
