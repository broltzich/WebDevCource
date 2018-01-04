from django.shortcuts import render
from django.views import View
from django.views.generic import ListView, DetailView
from .models import Musician, MusicalGroup, Membership
from django.http import HttpResponse, HttpRequest, HttpResponseRedirect
import MySQLdb
from .forms import *


# Create your views here.


class MusicianListView(ListView):
    model = Musician
    context_object_name = 'musicians'
    template_name = 'musicianListPa ge.html'


class MusicalGropuListView(ListView):
    model = MusicalGroup
    context_object_name = 'groups'
    template_name = 'musicalGroupListPage.html'


class MusicianDetailView(DetailView):
    model = Musician

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context


class MusicianView(View):
    def get(self, request, id):
        mus = Musician.objects.get(id=int(id))
        data = {
            'musician': {
                    'id': mus.id,
                    'name': mus.name,
                    'birth': mus.birth,
                    'role': mus.role
            }
        }
        return render(request, 'musicianPage.html', data)


def registration(request):
    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        if form.is_valid():
            #

            return HttpResponseRedirect('/login/')
        else:
            form = RegistrationForm()
    return render(request, 'regForm.html', {'form': form})
