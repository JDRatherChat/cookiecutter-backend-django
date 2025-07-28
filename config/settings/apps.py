"""
Base Django apps, third-party apps, and local apps are categorized for better organization.

Define and organize Django apps into groups:
- DJANGO_APPS
- THIRD_PARTY_APPS
- LOCAL_APPS
"""

# Base Django apps
DJANGO_APPS = [
        'django.contrib.admin',
        'django.contrib.auth',
        'django.contrib.contenttypes',
        'django.contrib.sessions',
        'django.contrib.messages',
        'django.contrib.staticfiles',
        ]

# Third-party apps
THIRD_PARTY_APPS = [
        'rest_framework',
        ]

# Apps you create (Local apps)
LOCAL_APPS = [
        'apps.custom_user',
        'apps.dashboard',
        ]
