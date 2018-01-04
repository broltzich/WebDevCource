from django.contrib import admin

from .models import Musician, MusicalGroup, Membership

# Register your models here.

admin.site.register(MusicalGroup)
admin.site.register(Musician)
admin.site.register(Membership)
