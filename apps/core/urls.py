from django.urls import path

from . import api_views, views

urlpatterns = [
    path("", views.home, name="home"),
    path("api/health/", api_views.HealthCheckView.as_view(), name="api-health"),
]
