from django.contrib.auth.models import User
from django.db import models
from django.utils.translation import gettext_lazy as _


class Runner(User):
    class Meta:
        db_table = 'runner'
        verbose_name = _('Runner')
        verbose_name_plural = _('Runners')
    
    level = models.PositiveIntegerField(default=1)
    currentExp = models.PositiveIntegerField(default=0)
    levelUpExp = models.PositiveIntegerField(default=1000)
    totalSteps = models.PositiveIntegerField(default=0)
    earnedPts = models.PositiveIntegerField(default=0)

    fullname = models.TextField()

    def __str__(self) -> str:
        return self.username

