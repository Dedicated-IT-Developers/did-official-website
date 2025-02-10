from django.contrib import admin
from abouts.models import (
    SliderPoster, Team, PersonalProject, Project, ProjectImage, 
    ProjectDeveloper, Contact
)
from .models import CustomUser
from django.contrib.auth.admin import UserAdmin

# Register the custom user model
@admin.register(CustomUser)
class CustomUserAdmin(UserAdmin):
    model = CustomUser
    list_display = ('username', 'email', 'is_email_verified', 'is_staff', 'is_superuser')
    search_fields = ('username', 'email')
    ordering = ('username',)

# Register other models
@admin.register(SliderPoster)
class SliderPosterAdmin(admin.ModelAdmin):
    list_display = ('id', 'status', 'created', 'updated')
    list_filter = ('status',)
    search_fields = ('id',)

@admin.register(Team)
class TeamAdmin(admin.ModelAdmin):
    list_display = ('name', 'position', 'created', 'updated')
    search_fields = ('name', 'position')

@admin.register(PersonalProject)
class PersonalProjectAdmin(admin.ModelAdmin):
    list_display = ('project_name', 'description', 'created', 'updated')
    search_fields = ('project_name', 'description')
    
@admin.register(Project)
class ProjectAdmin(admin.ModelAdmin):
    list_display = ('project_name', 'project_type', 'created', 'updated')
    search_fields = ('project_name', 'project_type')

@admin.register(ProjectImage)
class ProjectImageAdmin(admin.ModelAdmin):
    list_display = ('project', 'uploaded_at')
    search_fields = ('project__project_name',)

@admin.register(ProjectDeveloper)
class ProjectDeveloperAdmin(admin.ModelAdmin):
    list_display = ('project', 'team', 'role')
    search_fields = ('project__project_name', 'team__name', 'role')

@admin.register(Contact)
class ContactAdmin(admin.ModelAdmin):
    list_display = ('email', 'number', 'address', 'website')
    search_fields = ('email', 'number')
