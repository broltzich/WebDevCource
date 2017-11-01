from django.conf.urls import url
from . import views


app_name = 'test_app'

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^function_view/', views.function_view),
    url(r'^class_based_view/', views.ExampleClassBased.as_view())
]
