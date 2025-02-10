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
from abouts.views import Home, about, Projects, ViewProjects, TeamListView, JoinView

urlpatterns = [
    path('admin/', admin.site.urls),
    
    path('', Home.as_view(), name="index"),
    path('index/', Home.as_view()),
    path('about/', about),
    path('projects/', Projects.as_view()),
    path('view_projects/<int:pk>/', ViewProjects.as_view()),
    path('team/', TeamListView.as_view()),
    path('join/', JoinView.as_view()),
    
    path('user/', include('users.urls')),
    
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
