from django.db import models

# Create your models here.


class MusicalGroup(models.Model):
    class Meta:
        db_table = 'musicalgroup'
    title = models.CharField(max_length=100, null=False)
    style = models.CharField(max_length=120, null=True)
    country = models.CharField(max_length=40, null=True)

    def __str__(self):
        return self.title


class Musician(models.Model):
    class Meta:
        db_table = 'musician'
    name = models.CharField(max_length=100, null=False)
    birth = models.DateField(null=True)
    role = models.CharField(max_length=70, null=True)
    group = models.ManyToManyField(MusicalGroup, through='Membership')

    def __str__(self):
        return self.name


class Membership(models.Model):
    class Meta:
        db_table = 'membership'
    musicalGroup = models.ForeignKey(MusicalGroup)
    musician = models.ForeignKey(Musician)
    entered = models.DateField(null=True)
    left = models.DateField(null=True)


class Account(models.Model):
    class Meta:
        db_table = 'account'
    login = models.CharField(max_length=20, null=False)
    email = models.CharField(max_length=30, null=False)
    password = models.CharField(max_length=30, null=False)
    owner = models.OneToOneField(Musician, on_delete=models.CASCADE, null=True)
