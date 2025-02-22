import json

# from django.contrib.auth.models import User
from .models import CustomUser

from django import forms
from django.contrib.auth.forms import UserCreationForm, UserChangeForm

from abouts.models import Team

class TeamForm(forms.ModelForm):
    
    skills = forms.CharField(widget=forms.HiddenInput(), required=False)
    
    class Meta:
        model = Team
        fields = ["photo", "name", "position", "objectives", "skills", "website"]
        widgets = {
            "name": forms.TextInput(attrs={"class": "w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-red-400 bg-transparent"}),
            "position": forms.TextInput(attrs={"class": "w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-red-400 bg-transparent"}),
            "objectives": forms.Textarea(attrs={"class": "w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-red-400 bg-transparent", "rows": 3}),
            # "skills": forms.Textarea(attrs={"class": "w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-red-400 bg-transparent", "rows": 3}),
            "website": forms.URLInput(attrs={"class": "w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-red-400 bg-transparent"}),
        }
        
        def clean_skills(self):
            skills = self.cleaned_data.get('skills', '[]')  # Default to empty list
            try:
                skills_list = json.loads(skills)  # Convert JSON string to list
                return list(set(skill.strip() for skill in skills_list if skill.strip()))  # Remove duplicates
            except json.JSONDecodeError:
                return []
        
        
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
