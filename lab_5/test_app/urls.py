from django.conf.urls import url
from . import views


app_name = 'test_app'

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^function_view/', views.function_view),
    url(r'^class_based_view/', views.ExampleClassBased.as_view()),
    url(r'^games/$', view=views.GamesView.as_view(), name='game_list_view'),
    url(r'^game/(?P<id>\d+)$', view=views.GameView.as_view(), name='game_view')
]
