from django.shortcuts import render
from django.views import View
from django.views.generic import ListView, DetailView
from .models import MusicalGroup, Membership
from django.http import HttpResponse, HttpRequest, HttpResponseRedirect
import MySQLdb
from .forms import *
from django.contrib.auth import login, logout, authenticate


# Create your views here.


def index(request):
    return render(request, 'homePage.html')

class MusicianListView(ListView):
    model = User
    context_object_name = 'musicians'
    template_name = 'musicianListPage.html'


class MusicalGropuListView(ListView):
    model = MusicalGroup
    context_object_name = 'groups'
    template_name = 'musicalGroupListPage.html'


class MusicianView(View):
    def get(self, request, id):
        mus = User.objects.get(id=int(id))
        data = {
            'musician': {
                    'id': mus.id,
                    'name': mus.name,
                    'birth': mus.birth,
                    'role': mus.role
            }
        }
        return render(request, 'musicianPage.html', data)

"""
def registration(request):
    name_dict = {}
    errors = []
    form = RegistrationForm(request.POST)

    if request.method == 'POST' and form.is_valid():
        
        data = form.cleaned_data
        name_list = ['name', 'login', 'password', 'password2', 'email']
        name_dict = {x: request.POST.get(x, '') for x in name_list}

        name = data['name']
        if not name:
            errors.append('Enter the name')

        login = data['login']
        if not login:
            errors.append('Enter the login')
        elif len(login) < 5:
            errors.append('Login length must at least 5 characters')

        email = data['email']
        if not email:
           errors.append('Enter the email')

        password = data['password']
        if not password:
            errors.append('Enter the password')
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

            return HttpResponseRedirect('/musicians/')
    else:
        form = RegistrationForm()

    return render(request, 'regForm.html', {'error': errors, 'name_dict': name_dict, 'form': form})
"""

class signUpView(View):

    def post(self, request):
        logout(request)

        if request.POST:
            user = User.objects.create_user(
                username=request.POST['username'],
                password=request.POST['password'],
                email=request.POST['email']
            )
            if user:
                login(request, user)
                return HttpResponseRedirect('/')
