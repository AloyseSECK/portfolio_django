from django.urls import path, include
from . import views
from django.conf import settings
from django.conf.urls.static import static
from django.conf.urls.i18n import i18n_patterns

urlpatterns = [
    path('', views.home, name='home'),
    path('video/', views.video, name='video'),
    path('cv/', views.render_resume, name='render_resume'),
    path('certificats/', views.certificats, name='certificats'),
    path('i18n/', include('django.conf.urls.i18n')),
]

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)


