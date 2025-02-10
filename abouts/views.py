from django.shortcuts import render, HttpResponse

from django.views.generic import ListView, DetailView
from django.shortcuts import get_object_or_404
from django.contrib.auth import get_user_model
from django.conf import settings
from .models import SliderPoster, Team, PersonalProject, Project, ProjectImage, ProjectDeveloper, Contact
from django.db.models import Prefetch

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
        return Team.objects.prefetch_related(
            Prefetch('project_developers', queryset=ProjectDeveloper.objects.select_related('project')),
            Prefetch('personal_projects')
        )
        

# class TeamDetailView(DetailView):
#     model = Team
#     template_name = 'team_detail.html'
#     context_object_name = 'team'


class JoinView(ListView):
    model = Contact
    template_name = 'how_to_join.html'
    context_object_name = 'contacts'