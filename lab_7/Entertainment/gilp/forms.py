from django import forms
from .models import *


class SignUpForm(forms.Form):
    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email', 'password']
    username = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control form-group', 'placeholder': 'Username'}), label='username')
    first_name = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control form-group', 'placeholder': 'First name'}), label='first name')
    last_name = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control form-group', 'placeholder': 'Last name'}), label='last name')
    email = forms.CharField(min_length=5, widget=forms.TextInput(attrs={'class': 'form-control form-group', 'placeholder': 'Email'}), label='email')
    password = forms.CharField(min_length=6, widget=forms.PasswordInput(attrs={'class': 'form-control form-group', 'placeholder': 'Password'}), label='password')
    password2 = forms.CharField(min_length=6, widget=forms.PasswordInput(attrs={'class': 'form-control form-group', 'placeholder': 'Confirm password'}), label='confirm password')


class AuthenticationForm(forms.Form):
    class Meta:
        model = User
        # exclude = ['name', 'email', 'owner']
    login = forms.CharField(min_length=5, label='Login')
    password = forms.CharField(min_length=6, widget=forms.PasswordInput, label='password')
