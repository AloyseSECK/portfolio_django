from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('home2/', views.home2, name='home2'),
    path('cv/', views.render_xml, name='render_xml'),
]

