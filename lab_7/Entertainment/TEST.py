from django.shortcuts import render
from django.views import View
from gilp.models import MusicianModel, MembershipModel, MusicalGroupModel
from django.http import HttpResponse, HttpRequest
import MySQLdb

#musicians = MusicianModel.objects.all()
#for i in musicians:
    #print(i)
