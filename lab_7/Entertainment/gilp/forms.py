from django import forms
from .models import *


class RegistrationForm(forms.Form):
    class Meta:
        model = Account
        # exclude = ['login', 'password', 'owner']
    name = forms.CharField(widget=forms.TextInput(attrs={'class'}), label='name')
    login = forms.CharField(min_length=5, label='login')
    email = forms.CharField(min_length=5, label='email')
    password = forms.CharField(min_length=6, widget=forms.PasswordInput, label='password')
    password2 = forms.CharField(min_length=6, widget=forms.PasswordInput, label='confirm password')


class AuthenticationForm(forms.Form):
    class Meta:
        model = Account
        # exclude = ['name', 'email', 'owner']
    login = forms.CharField(min_length=5, label='Login')
    password = forms.CharField(min_length=6, widget=forms.PasswordInput, label='password')
