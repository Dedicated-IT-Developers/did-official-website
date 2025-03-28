from django.contrib import admin
from abouts.models import (
    SliderPoster, Team, Education, Experience, PersonalProject, Project, ProjectImage, 
    ProjectDeveloper, Contact
)
from .models import CustomUser
from django.contrib.auth.admin import UserAdmin
from .forms import TeamForm, PersonalProjectForm, ProjectAdminForm

class RestrictedAdmin(admin.ModelAdmin):
    """Base admin class to restrict dropdown choices to only the logged-in user's data."""

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == "team":
            if not request.user.is_superuser:
                kwargs["queryset"] = Team.objects.filter(user=request.user)
        return super().formfield_for_foreignkey(db_field, request, **kwargs)


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
    
    form = TeamForm
    
    list_display = ('name', 'position', 'created', 'updated')
    search_fields = ('name', 'position')
    
    def get_form(self, request, obj=None, **kwargs):
        # Ensure the form is passed the request
        kwargs['form'] = TeamForm
        form = super().get_form(request, obj, **kwargs)

        # Inject request into the form instance
        class CustomForm(form):
            def __new__(cls, *args, **kwargs):
                kwargs['request'] = request
                return form(*args, **kwargs)
        
        return CustomForm
    
    def get_queryset(self, request):
        """Restrict queryset to show only the logged-in user's data."""
        qs = super().get_queryset(request)
        if request.user.is_superuser:
            return qs  # Allow superusers to see all teams
        return qs.filter(user=request.user)  # Staff users only see their team

    def has_change_permission(self, request, obj=None):
        """Allow editing only if the object belongs to the logged-in user."""
        if obj is None:
            return True
        return obj.user == request.user or request.user.is_superuser

    # def has_delete_permission(self, request, obj=None):
    #     """Allow deletion only if the object belongs to the logged-in user."""
    #     if obj is None:
    #         return True
    #     return obj.user == request.user or request.user.is_superuser

    def save_model(self, request, obj, form, change):
        """Ensure the logged-in user is set as the owner of the team."""
        if not obj.pk:  # Only set user on new objects
            obj.user = request.user
        obj.save()
        
    
@admin.register(Education)
class EducationAdmin(RestrictedAdmin):
    
    list_display = ('school', 'degree', 'field_of_study', 'created', 'updated')
    search_fields = ('school', 'degree')
    
    def get_queryset(self, request):
        qs = super().get_queryset(request)
        if request.user.is_superuser:
            return qs
        return qs.filter(team__user=request.user)

    def has_change_permission(self, request, obj=None):
        if obj is None:
            return True
        return obj.team.user == request.user or request.user.is_superuser

    def has_delete_permission(self, request, obj=None):
        if obj is None:
            return True
        return obj.team.user == request.user or request.user.is_superuser

    def save_model(self, request, obj, form, change):
        if not obj.pk:
            obj.team = Team.objects.get(user=request.user)  # Auto-assign team
        obj.save()

@admin.register(Experience)
class ExperienceAdmin(RestrictedAdmin):
    list_display = ('company', 'position', 'created', 'updated')
    search_fields = ('school', 'degree')
    
    def get_queryset(self, request):
        qs = super().get_queryset(request)
        if request.user.is_superuser:
            return qs
        return qs.filter(team__user=request.user)

    def has_change_permission(self, request, obj=None):
        if obj is None:
            return True
        return obj.team.user == request.user or request.user.is_superuser

    def has_delete_permission(self, request, obj=None):
        if obj is None:
            return True
        return obj.team.user == request.user or request.user.is_superuser

    def save_model(self, request, obj, form, change):
        if not obj.pk:
            obj.team = Team.objects.get(user=request.user)  # Auto-assign team
        obj.save()
    
@admin.register(PersonalProject)
class PersonalProjectAdmin(RestrictedAdmin):
    
    form = PersonalProjectForm
    
    list_display = ('project_name', 'description', 'created', 'updated')
    search_fields = ('project_name', 'description')
    
    def get_queryset(self, request):
        qs = super().get_queryset(request)
        if request.user.is_superuser:
            return qs
        return qs.filter(team__user=request.user)

    def has_change_permission(self, request, obj=None):
        if obj is None:
            return True
        return obj.team.user == request.user or request.user.is_superuser

    def has_delete_permission(self, request, obj=None):
        if obj is None:
            return True
        return obj.team.user == request.user or request.user.is_superuser

    def save_model(self, request, obj, form, change):
        if not obj.pk:
            obj.team = Team.objects.get(user=request.user)  # Auto-assign team
        obj.save()
    
@admin.register(Project)
class ProjectAdmin(admin.ModelAdmin):
    
    form = ProjectAdminForm
    
    # class Media:
    #     js = ('admin/js/custom_admin.js',)
    
    list_display = ('project_name', 'project_type', 'created', 'updated')
    search_fields = ('project_name', 'project_type')
    
    def get_queryset(self, request):
        """Limit the displayed projects to only those related to the logged-in user."""
        qs = super().get_queryset(request)

        if request.user.is_superuser:
            return qs  # Superusers can see all projects

        # Get the projects where the user is involved (assuming a relation exists)
        team = Team.objects.filter(user=request.user).first()
        if team:
            return qs.filter(projectdeveloper__team=team)  # Adjust field based on your model

        return qs.none()  # Return no projects if user is not involved

    def has_add_permission(self, request):
        """Disable adding new projects for non-superusers."""
        return request.user.is_superuser

    def has_change_permission(self, request, obj=None):
        """Disable editing for non-superusers."""
        return request.user.is_superuser

    def has_delete_permission(self, request, obj=None):
        """Disable deletion for non-superusers."""
        return request.user.is_superuser

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
