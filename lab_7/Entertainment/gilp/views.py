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
    template_name = 'musicianListPage.html'


class MusicalGropuListView(ListView):
    model = MusicalGroup
    context_object_name = 'groups'
    template_name = 'musicalGroupListPage.html'


class AccountListView(ListView):
    model = Account
    context_object_name = 'accounts'
    template_name = 'accountListPage.html'

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
    name_dict = {}
    errors = []

    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        if form.is_valid():
            data = form.cleaned_data
            name_list = ['login', 'password', 'password2', 'email']
            name_dict = {x: request.POST.get(x, '') for x in name_list}

            login = data['login']
            if not login:
                errors.append('Enter login')
            elif len(login) < 5:
                errors.append('Login length must at least 5 characters')

            email = data['email']
            if not email:
                errors.append('Enter email')

            password = data['password']
            if not password:
                errors.append('Enter password')
            elif len(password) < 6:
                errors.append('Password length must be at least 6 characters')
            elif password != data['password2']:
                errors.append('Passwords do not match')

            if not errors:
                new_form = form.save(commit=False)
                new_form.login = data.get('login')
                new_form.email = data.get('email')
                new_form.password = data.get('password')
                new_form.save()
                form.save_m2m()

            return HttpResponseRedirect('/login/')
        else:
            form = RegistrationForm()
    return render(request, 'regForm.html', {'error': errors, 'name_dict': name_dict, 'form': form})
