from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('cv/', views.render_xml, name='render_xml'),
    path('cv-styled/', views.render_styled_cv, name='render_styled_cv'),
]

