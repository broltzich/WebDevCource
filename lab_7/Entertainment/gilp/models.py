from django.db import models
from django.contrib.auth.models import User

# Create your models here.


class MusicalGroup(models.Model):
    class Meta:
        db_table = 'musicalgroup'
    title = models.CharField(max_length=100, null=False)
    style = models.CharField(max_length=120, null=True)
    country = models.CharField(max_length=40, null=True)

    def __str__(self):
        return self.title

"""
class Musician(models.Model):
    class Meta:
        db_table = 'musician'
    name = models.CharField(max_length=100)
    birth = models.DateField(null=True)
    role = models.CharField(max_length=70, null=True)
    group = models.ManyToManyField(MusicalGroup, through='Membership', null=True)
    login = models.CharField(max_length=50, default='login111')
    email = models.CharField(max_length=50, default='email@box.com')
    password = models.CharField(max_length=30, default='password')

    def __str__(self):
        return self.name
"""

class Membership(models.Model):
    class Meta:
        db_table = 'membership'
    musicalGroup = models.ForeignKey(MusicalGroup, on_delete=models.CASCADE)
    musician = models.ForeignKey(User, on_delete=models.CASCADE)
    is_active = models.BooleanField

"""
class Account(models.Model):
    class Meta:
        db_table = 'account'
    name = models.CharField(max_length=50, null=True)
    login = models.CharField(max_length=50)
    email = models.CharField(max_length=50)
    password = models.CharField(max_length=30)
    owner = models.OneToOneField(Musician, on_delete=models.CASCADE, null=True)
"""
