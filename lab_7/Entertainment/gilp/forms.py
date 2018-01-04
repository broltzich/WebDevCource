from django import forms
from .models import *


class RegistrationForm(forms.Form):
    class Meta:
        model = Account
        exclude = ['name', 'login', 'password', 'owner']
    username = forms.CharField(min_length=5, label='login')
    password = forms.CharField(min_length=6, widget=forms.PasswordInput, label='password')
    password2 = forms.CharField(min_length=6, widget=forms.PasswordInput, label='password again')


class AuthenticationForm(forms.Form):
    class Meta:
        model = Account
        exclude = ['name', 'email', 'owner']
    login = forms.CharField(min_length=5, label='Login')
    password = forms.CharField(min_length=6, widget=forms.PasswordInput, label='Password')
