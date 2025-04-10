from django.db import models
from django.contrib.auth.models import User
from django.conf import settings
import os

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
        ('external-expert', 'External Expert'),
        ('co-founder', 'Co-Founder'),
        ('founder', 'Founder'),
    ]
    
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    name = models.CharField(max_length=191)
    position = models.CharField(max_length=191)
    role = models.CharField(max_length=50, choices=ROLE_CHOICES, default='member')
    objectives = models.TextField()
    skills = models.JSONField(default=list)  # List of skills
    photo = models.ImageField(upload_to='team_photos/', blank=True, null=True)
    website = models.URLField(max_length=191, verbose_name="Website Link", blank=True, null=True)
    
    github = models.URLField(max_length=191, blank=True, null=True)
    linkedin = models.URLField(max_length=191, blank=True, null=True)
    twitter = models.URLField(max_length=191, blank=True, null=True)
    facebook = models.URLField(max_length=191, blank=True, null=True)
    instagram = models.URLField(max_length=191, blank=True, null=True)
    youtube = models.URLField(max_length=191, blank=True, null=True)
    
    email = models.EmailField(max_length=191, blank=True, null=True)
    phone = models.CharField(max_length=20, blank=True, null=True)
    address = models.TextField(blank=True, null=True)
    
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    
    def get_photo_url(self):
        if self.photo:
            return self.photo.url
        return "/media/default.jpg"  # Default image path

    def __str__(self):
        return self.name
    
    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        if self.photo and os.path.exists(self.photo.path):
            os.chmod(self.photo.path, 0o644)
    
    class Meta:
        verbose_name = "User Profile"  # Singular name
        verbose_name_plural = "User Profiles"  # Plural name

class Education(models.Model):
    team = models.ForeignKey('Team', on_delete=models.CASCADE, related_name='education')
    school = models.CharField(max_length=191)
    degree = models.CharField(max_length=191)
    field_of_study = models.CharField(max_length=191, blank=True, null=True)
    start_year = models.IntegerField()
    end_year = models.IntegerField(blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return f"{self.degree} at {self.school} - {self.team.name}"
    
    class Meta:
        verbose_name = "Education"
        verbose_name_plural = "Educations"

class Experience(models.Model):
    team = models.ForeignKey('Team', on_delete=models.CASCADE, related_name='experience')
    company = models.CharField(max_length=191)
    position = models.CharField(max_length=191)
    start_date = models.DateField()
    end_date = models.DateField(blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        end = self.end_date if self.end_date else "Present"
        return f"{self.position} at {self.company} - {self.team.name} ({self.start_date} to {end})"
    
    class Meta:
        verbose_name = "Work Experience"
        verbose_name_plural = "Work Experiences"
    
class PersonalProject(models.Model):
    team = models.ForeignKey(Team, on_delete=models.CASCADE, related_name='personal_projects')
    project_name = models.CharField(max_length=191)
    project_link = models.URLField(max_length=191, verbose_name="Website Link", blank=True, null=True)
    description = models.TextField()
    tech_stack = models.JSONField(default=list)  # Technologies used
    features = models.JSONField(default=list)  # Features of the project
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.project_name} (Personal) - {self.team.name}"
    
    class Meta:
        verbose_name = "Personal Project"
        verbose_name_plural = "Personal Projects"

class Project(models.Model):
    STATUS_CHOICES = [
        ('planning', 'Planning'),
        ('design', 'Design'),
        ('development', 'Development'),
        ('testing', 'Testing'),
        ('pre-deployment', 'Pre-deployment'),
        ('implemented & maintained', 'Implemented & Maintained'),
        ('under-maintenance', 'Under Maintenance'),
    ]
    project_name = models.CharField(max_length=191)
    project_type = models.CharField(max_length=191)
    description = models.TextField()
    tech_stack = models.JSONField(default=list)  # List of techs used
    features = models.JSONField(default=list)  # 
    link = models.URLField(blank=True, null=True)
    project_start = models.DateField(blank=True, null=True)
    project_end = models.DateField(blank=True, null=True)  # Blank & null for ongoing projects
    status = models.CharField(max_length=50, choices=STATUS_CHOICES, default='implemented & maintained')
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
    
    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        # Ensure file exists before changing permissions
        if self.image and os.path.exists(self.image.path):
            os.chmod(self.image.path, 0o644)


class ProjectRole(models.Model):
    CATEGORY_CHOICES = [
        ('Core IT', 'Core IT Development Team'),
        ('Support', 'Support & Auxiliary Roles'),
        ('Specialized', 'Specialized Roles'),
    ]

    name = models.CharField(max_length=191, unique=True, help_text="Full role name (e.g., Project Manager)")
    acronym = models.CharField(max_length=20, unique=True, help_text="Short code (e.g., PM)")
    description = models.TextField(blank=True, help_text="Brief description of the role")
    category = models.CharField(max_length=20, choices=CATEGORY_CHOICES, default='Core IT')

    def __str__(self):
        return f"{self.name} ({self.acronym})"


class ProjectDeveloper(models.Model):
    project = models.ForeignKey(Project, on_delete=models.CASCADE)
    team = models.ForeignKey(Team, on_delete=models.CASCADE, related_name='project_developers')
    role = models.CharField(max_length=191, help_text="Comma-separated roles")

    def get_roles_list(self):
        """Return roles as a list"""
        return self.role.split(',') if self.role else []
    
    def __str__(self):
        return f"{self.team.name} - {self.role} ({self.project.project_name})" 

class Contact(models.Model):
    email = models.EmailField()
    number = models.CharField(max_length=15)
    address = models.TextField()
    website = models.URLField(blank=True, null=True)

    def __str__(self):
        return self.email
