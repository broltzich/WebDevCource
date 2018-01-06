from django.conf.urls import url

from . import views

app_name = 'gilp'

urlpatterns = [
    #url(r'^$', views.index, name='index'),
    url(r'^musicians/$', view=views.MusicianListView.as_view(), name='musician_list_view'),
    url(r'^groups/$', view=views.MusicalGropuListView.as_view(), name='musical_group_list_view'),
    url(r'^accounts/$', view=views.AccountListView.as_view(), name='account_list_view'),
    url(r'^musicians/(?P<id>\d+)/', view=views.MusicianView.as_view(), name='musician_view'),
    # url(r'^musicians/(?P<pk>\d+)/', view=views.MusicianDetailView.as_view(), name='musicianPage')

]
