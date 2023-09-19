from django.db import models
from django.utils.translation import gettext_lazy as _

from api.models.runner import Runner

class LobbyMessage(models.Model):
    class Meta:
        db_table = 'lobby_message'
        verbose_name = _('LobbyMessage')
        verbose_name_plural = _('LobbyMessages')

    user = models.ForeignKey(Runner, on_delete=models.CASCADE)
    content = models.CharField(max_length=255)
    createdAt = models.DateTimeField(auto_now_add=True)