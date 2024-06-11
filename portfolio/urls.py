from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('cv/', views.render_xml, name='render_xml'),
]

