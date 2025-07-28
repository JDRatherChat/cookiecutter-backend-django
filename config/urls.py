"""
Root URL configuration for the project.
"""

from django.conf import settings
from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path("admin/", admin.site.urls),
    path("", include("apps.core.urls")),
    # Example for your apps:
    # path('users/', include('apps.custom_user.urls')),
    # path('dashboard/', include('apps.dashboard.urls')),
]

if settings.DEBUG:
    import debug_toolbar

    urlpatterns += [
        path("__debug__/", include(debug_toolbar.urls)),
    ]
