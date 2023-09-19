from django.urls import path, include
from api import views
from rest_framework_simplejwt import views as jwt_views

urlpatterns = [
    path('token/refresh', jwt_views.TokenRefreshView.as_view(), name='token_refresh'),
    path('histories', views.GetUserHistory.as_view()),
    path('auth/login', views.Login.as_view()),
    path('auth/signup', views.RunnerSignUp.as_view()),
    path('auth/profile', views.RunnerProfile.as_view()),
    path('lobby/', views.LobbyGetAll.as_view()),
    path('lobby/delete', views.LobbyDeleteAll.as_view()),
    path('lobby/create', views.LobbyCreate.as_view()),
    path('lobby/<int:lobby_id>', views.LobbyGet.as_view()),
    path('lobby/join', views.LobbyJoin.as_view()),
    path('lobby/left', views.LobbyLeft.as_view()),
    path('lobby/<int:lobby_id>/run', views.RunInLobby.as_view()),

    path('lobby_chat/get_all_lobby_messages', views.GetAllLobbyMessages.as_view()),
    path('lobby_chat/post_lobby_message', views.RunnerProfile.as_view())
]