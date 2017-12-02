from django.shortcuts import render
from django.views import View
from django.views.generic import ListView
from .models import MusicalGroupModel, MusicianModel, MembershipModel
from django.http import HttpResponse, HttpRequest
import MySQLdb

# Create your views here.


class MusicianListView(ListView):
    model = MusicianModel
    context_object_name = 'musicians'
    template_name = 'musicianListPage.html'


class MusicianView(View):
    def get(self, request, person_id):
        person = MusicianModel.objects.get(id=int(person_id))
        return render(request, 'musicianPage.html', person)
