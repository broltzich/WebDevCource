from django.conf.urls import url
from lab_5.test_app import views


app_name = 'test_app'

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^function_view/', views.function_view),
    url(r'^class_based_view/', views.ExampleClassBased.as_view()),
    url(r'^gameList/', view=views.GamesView.as_view(), name='games_url'),
]
