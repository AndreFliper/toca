# URLs para redirecionamento

from django.urls import path
from django.contrib.auth.views import LoginView, LogoutView
from . import views

urlpatterns = [
    path('', views.index, name='index'),  # Página inicial
    path('login/', LoginView.as_view(template_name='login.html', redirect_authenticated_user=True), name='login'),
    path('logout/', LogoutView.as_view(), name='logout'),  # Página de logout
    path('registro/', views.registro, name='registro'),  # Página de registro
    path('configurar-conta/', views.configurar_conta, name='configurar_conta'),
]
