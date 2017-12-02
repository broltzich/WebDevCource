from django.shortcuts import render
from django.views import View
from .models import MusicalGroupModel, MusicianModel, MembershipModel
from django.http import HttpResponse, HttpRequest
import MySQLdb

# Create your views here.


class MusicianView(View):
    def get(self, request, id):
        musicians = MusicianModel.objects.all()
        return render(request, )


