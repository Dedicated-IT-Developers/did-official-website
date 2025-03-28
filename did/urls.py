"""
URL configuration for did project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from abouts.views import Home, about, Projects, ViewProjects, TeamListView, JoinView, protfolio

from django.contrib.auth import views as auth_views

urlpatterns = [
    path('admin/', admin.site.urls),
    
    path('', Home.as_view(), name="index"),
    path('index/', Home.as_view()),
    path('about/', about),
    path('projects/', Projects.as_view()),
    path('view_projects/<int:pk>/', ViewProjects.as_view()),
    path('team/', TeamListView.as_view()),
    path('portfolio/<str:codename>/', protfolio),
    path('join/', JoinView.as_view()),
    
    # path('user/', include('users.urls')),
    
    path('password_reset/', auth_views.PasswordResetView.as_view(), name='admin_password_reset'),
    path('password_reset/done/', auth_views.PasswordResetDoneView.as_view(), name='password_reset_done'),
    path('reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(), name='password_reset_confirm'),
    path('reset/done/', auth_views.PasswordResetCompleteView.as_view(), name='password_reset_complete'),
    
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
