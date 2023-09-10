from django.urls import path, include
from api import views
from rest_framework_simplejwt import views as jwt_views

urlpatterns = [
    path('token/refresh', jwt_views.TokenRefreshView.as_view(), name='token_refresh'),
    path('auth/login', views.Login.as_view()),
    path('auth/signup', views.RunnerSignUp.as_view()),
    path('auth/profile', views.RunnerProfile.as_view()),
    path('auth/createlobby', views.LobbyCreate.as_view()),
    path('auth/getalllobby', views.LobbyGetAll.as_view()),
    path('auth/getlobby', views.LobbyGet.as_view())
]