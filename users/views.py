from django.shortcuts import render, redirect, HttpResponse, get_object_or_404
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from .forms import SignUpForm, LoginForm, PasswordResetForm, VerifyForm
from django.views.generic import CreateView, TemplateView
# from django.contrib.auth.models import User
from .models import CustomUser as User
from django.urls import reverse_lazy
from django.contrib.auth.views import LoginView
from django.contrib.auth.tokens import default_token_generator
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_bytes
from django.views import View
from django.template.loader import render_to_string
from django.core.mail import send_mail
from django.contrib.auth.views import PasswordResetConfirmView
from django.contrib.auth.forms import SetPasswordForm
from django.contrib.sites.shortcuts import get_current_site

from django.contrib.auth.decorators import login_required

from abouts.models import Team, PersonalProject
from .forms import TeamForm, PersonalProjectForm

# ----------------------
# LOGGER SAMPLE
# ----------------------
import logging

# Create a logger instance
logger = logging.getLogger(__name__)
def my_view_with_logger():
    # Sample Logger
    logger.debug('This is a debug message')
    logger.info('This is an info message')
    logger.warning('This is a warning message')
    logger.error('This is an error message')
    logger.critical('This is a critical error message')
    

# Create your views here.
# ----------------------
# VIEWS
# ----------------------

class signup(CreateView):
    model = User
    form_class = SignUpForm
    template_name = 'signup.html'
    # success_url = reverse_lazy('verify')
    
    def form_valid(self, form):
        # Save the user but don't activate it yet
        user = form.save(commit=False)
        user.is_email_verified = False  # User cannot log in until email is verified
        user.save()
        
        # Generate token and UID
        uid = urlsafe_base64_encode(force_bytes(user.pk))
        token = default_token_generator.make_token(user)

        # Prepare email verification
        link = reverse_lazy('verified', kwargs={'uidb64': uid, 'token': token})
        verify_url = f"{self.request.build_absolute_uri(link)}"
        email_subject = 'Verification Requested'
        email_message = render_to_string('verify_email.html', {
            'user': user,
            'verify_url': verify_url,
        })
        # send mail
        send_mail(email_subject, email_message, 'confiredmail11@gmail.com', [user.email])
        messages.success(self.request, "An email has been sent with instructions to verification.")

        print('Check your email to verify your account.')
        return redirect('verify')

class verify(View):
    template_name = 'verify_form.html'

    def get(self, request):
        form = VerifyForm()
        return render(request, self.template_name, {'form': form})

    def post(self, request):
        form = VerifyForm(request.POST)
        if form.is_valid():
            email = form.cleaned_data['email']
            users = User.objects.filter(email=email)
            if users.exists():
                for user in users:
                    # Generate token and UID
                    uid = urlsafe_base64_encode(force_bytes(user.pk))
                    token = default_token_generator.make_token(user)
                    # Prepare email verification
                    link = reverse_lazy('verified', kwargs={'uidb64': uid, 'token': token})
                    verify_url = f"{self.request.build_absolute_uri(link)}"
                    email_subject = 'Verification Requested'
                    email_message = render_to_string('verify_email.html', {
                        'user': user,
                        'verify_url': verify_url,
                    })
                    # send mail
                    send_mail(email_subject, email_message, 'confiredmail11@gmail.com', [user.email])
                    messages.success(self.request, "An email has been sent with instructions to verification.")
            else:
                messages.error(request, "No user found with that email address.")
                print("No user found with that email address.")
            return redirect('verify')
        return render(request, self.template_name, {'form': form})

def verified(request, uidb64, token):
    try:
        uid = urlsafe_base64_decode(uidb64).decode()
        user = User.objects.get(pk=uid)
    except (TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None

    if user is not None and default_token_generator.check_token(user, token):
        user.is_email_verified = True
        user.save()
        messages.error(request, "Thank you for confirming your email. You can now log in.")
        return redirect('login')
    else:
        messages.error(request, "Invalid verification link.")
        return redirect('verify')

class sigin(LoginView):
    template_name = 'login.html'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['form'] = LoginForm()
        return context

    def post(self, request, *args, **kwargs):
        form = LoginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(request, username=username, password=password)
            if user is not None:
                if user.is_email_verified:
                    
                    # Check if the user is an admin (is_staff) or a regular user
                    # if user.is_staff:  # Admin role
                    #     login(request, user)
                    #     return redirect('dashboard')  # Redirect to admin dashboard
                    # else:  # Regular user role
                    #     login(request, user)
                    #     return redirect('user_page')  # Redirect to user page
                    
                    login(request, user)
                    return redirect('/user/profile')
                else:
                    # Email is not verified
                    messages.error(request, "Your email is not verified. Please check your inbox.")
                    return render(request, self.template_name, {'form': form})
            else:
                messages.error(request, "Invalid username or password.")
        return render(request, self.template_name, {'form': form})

def signout(request):
    logout(request)
    messages.success(request, "You were logged out.")
    return redirect('/')

class ForgotPasswordView(View):
    template_name = 'password_reset.html'

    def get(self, request):
        form = PasswordResetForm()
        return render(request, self.template_name, {'form': form})

    def post(self, request):
        form = PasswordResetForm(request.POST)
        if form.is_valid():
            email = form.cleaned_data['email']
            users = User.objects.filter(email=email)
            if users.exists():
                for user in users:
                    # Generate token and UID
                    uid = urlsafe_base64_encode(force_bytes(user.pk))
                    token = default_token_generator.make_token(user)
                    # Prepare email
                    link = reverse_lazy('password_reset_confirm', kwargs={'uidb64': uid, 'token': token})
                    reset_url = f"{request.build_absolute_uri(link)}"
                    email_subject = 'Password Reset Requested'
                    email_message = render_to_string('password_reset_email.html', {
                        'user': user,
                        'reset_url': reset_url,
                    })
                    send_mail(email_subject, email_message, 'confiredmail11@gmail.com', [email])
                messages.success(request, "An email has been sent with instructions to reset your password.")
                print("An email has been sent with instructions to reset your password.")
            else:
                messages.error(request, "No user found with that email address.")
                print("No user found with that email address.")
            return redirect('password_reset')
        return render(request, self.template_name, {'form': form})

class ResetPasswordView(PasswordResetConfirmView):
    template_name = 'password_reset_confirm.html'
    form_class = SetPasswordForm
    success_url = reverse_lazy('login')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['validlink'] = True
        return context

def custom_404_view(request, exception=None):
    return render(request, '404.html', status=404)


@login_required
def profile(request):
    user = request.user
    # Try to get the Team instance related to the user
    team, created = Team.objects.get_or_create(user=user)
    
    # Get all personal projects related to this team
    personal_projects = PersonalProject.objects.filter(team=team)
    
    if request.method == "POST":
        form = TeamForm(request.POST, request.FILES, instance=team)
        if form.is_valid():
            new_skills = form.cleaned_data['skills']
            if isinstance(team.skills, list):
                team.skills.extend(new_skills)  # Append new skills
                team.skills = list(set(team.skills))  # Remove duplicates
            else:
                team.skills = new_skills  # If no previous data, just save it
            team.save()
            messages.success(request, "Profile updated successfully!")
            return redirect("profile")
    else:
        form = TeamForm(instance=team)

    context = {
        "user": user,
        "form": form,
        "personal_project_form": PersonalProjectForm(),
        "personal_projects": personal_projects,
        "team": team if not created else None,  # None if newly created
    }
    return render(request, "profile.html", context)

@login_required
def addproject(request):
    user = request.user
    team = get_object_or_404(Team, user=user)  # Get the user's team

    if request.method == "POST":
        form = PersonalProjectForm(request.POST)
        if form.is_valid():           
            project = form.save(commit=False)
            
            new_tech_stack = form.cleaned_data['tech_stack']
            project.tech_stack = new_tech_stack
            
            new_features = form.cleaned_data['features']
            project.features = new_features
            
            project.team = team  # Assign the project to the user's team
            project.save()
            messages.success(request, "Project added successfully!")
        else:
            messages.error(request, "Error adding project. Please check your input.")

    return redirect("profile")  # Redirect back to the profile page

@login_required
def remove_project(request, id):
    project = get_object_or_404(PersonalProject, id=id)
    team = get_object_or_404(Team, user=request.user)

    # Optional: Check if the user has permission to delete the project
    if team != project.team:  # Adjust based on your model's ownership logic
        messages.error(request, "You do not have permission to delete this project.")
        return redirect("profile")  # Redirect to the appropriate page

    project.delete()
    messages.success(request, "Project successfully deleted.")
    return redirect("profile")  # Redirect to the appropriate page