from django.db import models

# Create your models here.


class MusicalGroupModel(models.Model):
    title = models.CharField(max_length=100, null=False)
    founded = models.DateField(null=True)
    style = models.CharField(max_length=120, null=True)
    country = models.CharField(max_length=40, null=True)


class MusicianModel(models.Model):
    name = models.CharField(max_length=100, null=False)
    birth = models.DateField(null=True)
    gender = models.CharField(max_length=1, null=True)
    role = models.CharField(max_length=70, null=True)
    group = models.ForeignKey(MusicalGroupModel, on_delete=models.CASCADE, null=True)


