from django.conf.urls import url
from . import views


app_name = 'gilp'

urlpatterns = [
    #url(r'^$', views.index, name='index'),
    url(r'^musicians/$', view=views.MusicianListView.as_view(), name='musician_list_view'),
    url(r'^musicians/(?P<person_id>\d+)$', view=views.MusicianView.as_view(), name='musician_view')
]
