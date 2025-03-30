from django.shortcuts import render, HttpResponse

from django.views.generic import ListView, DetailView
from django.shortcuts import get_object_or_404
from django.contrib.auth import get_user_model
from django.conf import settings
from .models import SliderPoster, Team, PersonalProject, Project, ProjectImage, ProjectDeveloper, Contact, Education, Experience
from django.db.models import Case, When, Value, IntegerField, Prefetch

# Create your views here.
class Home(ListView):
    model = SliderPoster
    template_name = 'home.html'
    context_object_name = 'sliders'

def about(request):
    return render(request, 'about.html')

class Projects(ListView):
    model = Project
    template_name = 'projects.html'
    context_object_name = 'projects'

    def get_queryset(self):
        return Project.objects.prefetch_related('images', 'projectdeveloper_set__team')

class ViewProjects(DetailView):
    model = Project
    template_name = 'view_projects.html'
    context_object_name = 'project'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['images'] = ProjectImage.objects.filter(project=self.object)
        context['developers'] = ProjectDeveloper.objects.filter(project=self.object)
        return context

class TeamListView(ListView):
    model = Team
    template_name = 'team.html'
    context_object_name = 'teams'
    
    def get_queryset(self):
        
        role_order = Case(
            When(role='founder', then=Value(1)),
            When(role='expert', then=Value(2)),
            When(role='member', then=Value(3)),
            When(role='alumni', then=Value(4)),
            output_field=IntegerField(),
        )
        
        # return Team.objects.prefetch_related(
        #     Prefetch('project_developers', queryset=ProjectDeveloper.objects.select_related('project')),
        #     Prefetch('personal_projects')
        # ).annotate(role_priority=role_order).order_by('role_priority','id')
        return (
            Team.objects.select_related('user')  # Join with CustomUser model
            .prefetch_related(
                Prefetch('project_developers', queryset=ProjectDeveloper.objects.select_related('project')),
                Prefetch('personal_projects')
            )
            .annotate(role_priority=role_order)
            .order_by('role_priority', 'id')
        )
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        for team in context['teams']:
            team.username = team.user.username  # Attach username to each team member
        return context
        

# class TeamDetailView(DetailView):
#     model = Team
#     template_name = 'team_detail.html'
#     context_object_name = 'team'


class JoinView(ListView):
    model = Contact
    template_name = 'how_to_join.html'
    context_object_name = 'contacts'

    
def protfolio(request, codename):
    username = codename

    profile = get_object_or_404(Team, user__username=username)  # Assuming codename is the username
    education = Education.objects.filter(team=profile)
    experience = Experience.objects.filter(team=profile)
    projects = PersonalProject.objects.filter(team=profile)
    # Get all projects where the team member is a developer
    involved_projects = Project.objects.filter(projectdeveloper__team=profile).distinct()
    
    context = {
        'profile': profile,
        'education': education,
        'experience': experience,
        'projects': projects,
        'involved_projects': involved_projects 
    }
    
    return render(request, "portfolio.html", context)