"""
Root URL configuration for the project.
"""

from django.contrib import admin
from django.urls import path

urlpatterns = [
    path("admin/", admin.site.urls),
    # Example for your apps:
    # path('users/', include('apps.custom_user.urls')),
    # path('dashboard/', include('apps.dashboard.urls')),
]
