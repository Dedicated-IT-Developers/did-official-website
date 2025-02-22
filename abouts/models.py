from django.db import models
from django.contrib.auth.models import User
from django.conf import settings

class SliderPoster(models.Model):
    STATUS_CHOICES = [
        ('active', 'Active'),
        ('inactive', 'Inactive')
    ]
    
    slider_image = models.ImageField(upload_to='slider_images/')
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='active')
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"Slider {self.id} - {self.status}" 

class Team(models.Model):
    
    ROLE_CHOICES = [
        ('member', 'Member'),
        ('alumni', 'Alumni'),
        ('expert', 'Expert'),
        ('founder', 'Founder')
    ]
    
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    name = models.CharField(max_length=255)
    position = models.CharField(max_length=255)
    role = models.CharField(max_length=10, choices=ROLE_CHOICES, default='member')
    objectives = models.TextField()
    skills = models.JSONField(default=list)  # List of skills
    photo = models.ImageField(upload_to='team_photos/', blank=True, null=True)
    website = models.URLField(max_length=200, verbose_name="Website Link", blank=True, null=True)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    
    def get_photo_url(self):
        if self.photo:
            return self.photo.url
        return "/media/default.jpg"  # Default image path

    def __str__(self):
        return self.name

class PersonalProject(models.Model):
    team = models.ForeignKey(Team, on_delete=models.CASCADE, related_name='personal_projects')
    project_name = models.CharField(max_length=255)
    project_link = models.URLField(max_length=200, verbose_name="Website Link", blank=True, null=True)
    description = models.TextField()
    tech_stack = models.JSONField(default=list)  # Technologies used
    features = models.JSONField(default=list)  # Features of the project
    link = models.URLField(blank=True, null=True)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.project_name} (Personal) - {self.team.name}"

class Project(models.Model):
    project_name = models.CharField(max_length=255)
    project_type = models.CharField(max_length=255)
    description = models.TextField()
    tech_stack = models.JSONField(default=list)  # List of techs used
    features = models.JSONField(default=list)  # 
    link = models.URLField(blank=True, null=True)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.project_name

class ProjectImage(models.Model):
    project = models.ForeignKey(Project, on_delete=models.CASCADE, related_name='images')
    image = models.ImageField(upload_to='project_images/')
    uploaded_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Image for {self.project.project_name}" 

class ProjectDeveloper(models.Model):
    project = models.ForeignKey(Project, on_delete=models.CASCADE)
    team = models.ForeignKey(Team, on_delete=models.CASCADE, related_name='project_developers')
    role = models.CharField(max_length=255)

    def __str__(self):
        return f"{self.team.name} - {self.role}" 

class Contact(models.Model):
    email = models.EmailField()
    number = models.CharField(max_length=15)
    address = models.TextField()
    website = models.URLField(blank=True, null=True)

    def __str__(self):
        return self.email
