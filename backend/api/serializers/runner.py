from api.models.runner import Runner
from rest_framework import serializers
from django.contrib.auth.models import User
import django.contrib.auth.password_validation as validators
from django.core import exceptions
import re

class RunnerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Runner
        fields = [
            "id",
            "username",
            "level",
            "currentExp",
            "levelUpExp",
            "totalSteps",
            "earnedPts",
            "fullname"
        ]
    
class RunnerSignUpSerializer(serializers.Serializer):
    username = serializers.CharField(max_length=255, required=True)
    password = serializers.CharField(max_length=255, required=True, write_only=True)
    fullname = serializers.CharField(max_length=255, required=True)

    def validate_username(self, value):
        if User.objects.filter(username=value).exists():
            raise serializers.ValidationError("Username already existed")
        regex = re.compile(r'([A-Za-z0-9]+[.-_])*[A-Za-z0-9]+@[A-Za-z0-9-]+(\.[A-Z|a-z]{2,})+')
        if not re.fullmatch(regex, value):
            raise serializers.ValidationError("Invalid email format")
    
    def validate_password(self, value):
        try:
             # validate the password and catch the exception
            validators.validate_password(password=value)

         # the exception raised here is different than serializers.ValidationError
        except exceptions.ValidationError as e:
            raise serializers.ValidationError(list(e))