import json

# from django.contrib.auth.models import User
from .models import CustomUser

from django import forms
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django_select2.forms import Select2TagWidget

from abouts.models import Team, PersonalProject, Project

from django.utils.safestring import mark_safe

# Custom Form for Project Admin
class ProjectAdminForm(forms.ModelForm):
    
    class Meta:
        model = Project
        fields = "__all__"
        widgets = {
            'tech_stack': Select2TagWidget(),
            'features': Select2TagWidget(),
        }
        
        def clean_tech_stack(self):
            tech_stack = self.cleaned_data.get('tech_stack', '[]')  # Default to empty list
            try:
                tech_stack_list = json.loads(tech_stack)  # Convert JSON string to list
                return list(set(tech_stack.strip() for tech_stack in tech_stack_list if tech_stack.strip()))  # Remove duplicates
            except json.JSONDecodeError:
                return []
            
        def clean_features(self):
            features = self.cleaned_data.get('features', '[]')  # Default to empty list
            try:
                features_list = json.loads(features)  # Convert JSON string to list
                return list(set(features.strip() for features in features_list if features.strip()))  # Remove duplicates
            except json.JSONDecodeError:
                return []

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        
        if self.instance and self.instance.pk:
            tech_stack_values = ', '.join(self.instance.tech_stack) if self.instance.tech_stack else "No data"
            features_values = ', '.join(self.instance.features) if self.instance.features else "No data"

            # Inject labels under the Select2 input fields
            self.fields['tech_stack'].help_text = mark_safe(f'<div style="margin-top: 5px; font-size: 12px; color: #555;"><strong>Current:</strong> {tech_stack_values}</div>')
            self.fields['features'].help_text = mark_safe(f'<div style="margin-top: 5px; font-size: 12px; color: #555;"><strong>Current:</strong> {features_values}</div>')

        # Ensure stored JSON data is converted to a comma-separated string
        # if self.instance and self.instance.pk:
        #     if isinstance(self.instance.tech_stack, list):  # Convert list to a comma-separated string
        #         self.fields['tech_stack'].initial = ', '.join(self.instance.tech_stack)
        #     if isinstance(self.instance.features, list):
        #         self.fields['features'].initial = ', '.join(self.instance.features)

    
        
class TeamForm(forms.ModelForm):
    
    # skills = forms.CharField(widget=forms.HiddenInput(), required=False)
    
    class Meta:
        model = Team
        fields = "__all__"
        widgets = {
            "name": forms.TextInput(attrs={"class": "w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-red-400 bg-transparent"}),
            "position": forms.TextInput(attrs={"class": "w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-red-400 bg-transparent"}),
            "objectives": forms.Textarea(attrs={"class": "w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-red-400 bg-transparent", "rows": 3}),
            # "skills": forms.Textarea(attrs={"class": "w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-red-400 bg-transparent", "rows": 3}),
            'skills': Select2TagWidget(),  # Enables multiple selection
            "website": forms.URLInput(attrs={"class": "w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-red-400 bg-transparent"}),
        }
        
        def clean_skills(self):
            skills = self.cleaned_data.get('skills', '[]')  # Default to empty list
            try:
                skills_list = json.loads(skills)  # Convert JSON string to list
                return list(set(skill.strip() for skill in skills_list if skill.strip()))  # Remove duplicates
            except json.JSONDecodeError:
                return []
            
            
    def __init__(self, *args, **kwargs):
        request = kwargs.pop('request', None)  # Get the request object
        super().__init__(*args, **kwargs)
        
        
        
        # If the user is NOT a superadmin, the dropdown will only show their own user account. If the user is a superadmin, they can see all users.
        #request = getattr(self, 'request', None)  # Get request if available
        if request and not request.user.is_superuser:
            # If the logged-in user is NOT a superuser, restrict choices
            self.fields['user'].queryset = CustomUser.objects.filter(id=request.user.id)
        else:
            # Superadmins can see all users
            self.fields['user'].queryset = CustomUser.objects.all()
        
        # If user is NOT superuser, limit choices to "Member"
        #request = kwargs.pop('request', None)  # Get the request object
        # if request and not request.user.is_superuser:
        #     # If user is NOT superuser, limit choices to "Member"
        #     self.fields['role'].choices = [('member', 'Member')]
        
        if request:
            if not request.user.is_superuser:
                # Regular users: Limit the user dropdown to their own profile
                self.fields['user'].queryset = CustomUser.objects.filter(id=request.user.id)
                # Limit the role dropdown to only show their assigned role
                if self.instance and self.instance.pk:
                    assigned_role = self.instance.role  # Get assigned role
                    self.fields['role'].choices = [(assigned_role, assigned_role.capitalize())]  # Restrict role choices
        
        # display the value of skills
        if self.instance and self.instance.pk:
            skills_values = ', '.join(self.instance.skills) if self.instance.skills else "No data"

            # Inject labels under the Select2 input fields
            self.fields['skills'].help_text = mark_safe(f'<div style="margin-top: 5px; font-size: 12px; color: #555;"><strong>Current:</strong> {skills_values}</div>')
        
class PersonalProjectForm(forms.ModelForm):
    
    #tech_stack = forms.CharField(widget=forms.HiddenInput(), required=False)
    #features = forms.CharField(widget=forms.HiddenInput(), required=False)
    
    class Meta:
        model = PersonalProject
        fields = ["project_name", "description", "project_link", "tech_stack", "features"]
        widgets = {
            "project_name": forms.TextInput(attrs={"placeholder": "Project Name", "class": "w-full px-3 py-2 border rounded-lg focus:ring-red-400 bg-transparent"}),
            "description": forms.Textarea(attrs={"class": "w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-red-400 bg-transparent", "rows": 3}),
            "project_link": forms.URLInput(attrs={"placeholder": "Project Link", "class": "w-full px-3 py-2 border rounded-lg focus:ring-red-400 bg-transparent"}),
            'tech_stack': Select2TagWidget(),
            'features': Select2TagWidget(),
        }
        
        
        def clean_tech_stack(self):
            tech_stack = self.cleaned_data.get('tech_stack', '[]')  # Default to empty list
            try:
                tech_stack_list = json.loads(tech_stack)  # Convert JSON string to list
                return list(set(tech_stack.strip() for tech_stack in tech_stack_list if tech_stack.strip()))  # Remove duplicates
            except json.JSONDecodeError:
                return []
            
        def clean_features(self):
            features = self.cleaned_data.get('features', '[]')  # Default to empty list
            try:
                features_list = json.loads(features)  # Convert JSON string to list
                return list(set(features.strip() for features in features_list if features.strip()))  # Remove duplicates
            except json.JSONDecodeError:
                return []
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        
        if self.instance and self.instance.pk:
            tech_stack_values = ', '.join(self.instance.tech_stack) if self.instance.tech_stack else "No data"
            features_values = ', '.join(self.instance.features) if self.instance.features else "No data"

            # Inject labels under the Select2 input fields
            self.fields['tech_stack'].help_text = mark_safe(f'<div style="margin-top: 5px; font-size: 12px; color: #555;"><strong>Current:</strong> {tech_stack_values}</div>')
            self.fields['features'].help_text = mark_safe(f'<div style="margin-top: 5px; font-size: 12px; color: #555;"><strong>Current:</strong> {features_values}</div>')    




class VerifyForm(forms.Form):
    
    email = forms.EmailField(
        widget=forms.EmailInput(
                attrs={'class': 'w-full bg-[#2A2A2A] text-white pl-12 pr-4 py-3 rounded-xl focus:outline-none focus:ring-2 focus:ring-red-500 border border-gray-800 placeholder-gray-500', 'placeholder':"Email"}
            )
    )
    
class SignUpForm(UserCreationForm):
    
    email = forms.EmailField(
        widget=forms.EmailInput(
                attrs={'class': 'form-control', 'placeholder':"Email"}
            )
    )
    username = forms.CharField(
        help_text='Required. 25 characters or fewer. Letters, digits and _ only.',
        min_length=1,
        max_length=25,
        widget=forms.TextInput(
                attrs={'class': 'form-control', 'placeholder':"Username"}
            )
        )
    password1 = forms.CharField(
        help_text='Your password can’t be too similar to your other personal information. Must contain at least 8 characters. Can’t be a commonly used password. Can’t be entirely numeric.',
        label='Password',
        min_length=8,
        max_length=30,
        widget=forms.PasswordInput(
                attrs={ 'class': 'form-control', 'placeholder':"Password"}
            )
        )
    password2 = forms.CharField(
        help_text='Enter the same password as before, for verification.',
        label='Confirm Password',
        min_length=8,
        max_length=30,
        widget=forms.PasswordInput(
                attrs={ 'class': 'form-control', 'placeholder':"Confirm password"}
            )
        )

    class Meta:
        model = CustomUser
        fields = ['email', 'username', 'password1', 'password2']

class LoginForm(forms.Form):
    username = forms.CharField(
        label='Username',
        min_length=1,
        max_length=25,
        widget=forms.TextInput(
                attrs={'class': 'w-full bg-[#2A2A2A] text-white pl-12 pr-4 py-3 rounded-xl focus:outline-none focus:ring-2 focus:ring-red-500 border border-gray-800 placeholder-gray-500', 'placeholder':"Username"}
            )
        )
    password = forms.CharField(
        label='Password',
        min_length=8,
        max_length=30,
        widget=forms.PasswordInput(
                attrs={ 'class': 'w-full bg-[#2A2A2A] text-white pl-12 pr-4 py-3 rounded-xl focus:outline-none focus:ring-2 focus:ring-red-500 border border-gray-800 placeholder-gray-500', 'placeholder':"Password"}
            )
        )
    
class PasswordResetForm(forms.Form):
    email = forms.EmailField(
        widget=forms.EmailInput(
                attrs={'class': 'w-full bg-[#2A2A2A] text-white pl-12 pr-4 py-3 rounded-xl focus:outline-none focus:ring-2 focus:ring-red-500 border border-gray-800 placeholder-gray-500', 'placeholder':"Email"}
            )
    )
