from django.contrib import admin
from django.contrib.auth.models import User
from .models import MusicalGroup, Membership

# Register your models here.

admin.site.register(MusicalGroup)

admin.site.register(Membership)
