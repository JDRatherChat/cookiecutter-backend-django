from django.urls import path

from . import api_views
from .views import home_view

urlpatterns = [
    path("", home_view, name="home"),
    path("api/health/", api_views.HealthCheckView.as_view(), name="api-health"),
]
