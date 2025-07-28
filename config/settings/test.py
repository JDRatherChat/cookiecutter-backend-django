"""
test.py

Testing-specific settings.
"""

from .base import *

PASSWORD_HASHERS = [
    'django.contrib.auth.hashers.MD5PasswordHasher',
]

DATABASES['default'] = env.db(default='sqlite:///test_db.sqlite3')
