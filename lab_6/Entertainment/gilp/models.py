from django.db import models

# Create your models here.


class MusicalGroupModel(models.Model):
    class Meta:
        db_table = 'musicalgroup'
    title = models.CharField(max_length=100, null=False)
    style = models.CharField(max_length=120, null=True)
    country = models.CharField(max_length=40, null=True)

    def __str__(self):
        return self.title


class MusicianModel(models.Model):
    class Meta:
        db_table = 'musician'
    name = models.CharField(max_length=100, null=False)
    birth = models.DateField(null=True)
    role = models.CharField(max_length=70, null=True)
    group = models.ManyToManyField(MusicalGroupModel, through='MembershipModel')

    def __str__(self):
        return self.name


class MembershipModel(models.Model):
    class Meta:
        db_table = 'membership'
    musicalGroup = models.ForeignKey(MusicalGroupModel)
    musician = models.ForeignKey(MusicianModel)
    entered = models.DateField(null=True)
    left = models.DateField(null=True)
