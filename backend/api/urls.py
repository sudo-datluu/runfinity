from django.urls import path, include
from api import views
from rest_framework_simplejwt import views as jwt_views

urlpatterns = [
    path('token/refresh', jwt_views.TokenRefreshView.as_view(), name='token_refresh'),
    path('auth/login', views.Login.as_view()),
    path('auth/signup', views.RunnerSignUp.as_view()),
    path('auth/profile', views.RunnerProfile.as_view()),
    path('lobby/<int:lobby_id>/run', views.RunInLobby.as_view()),
]