from django.contrib.auth import get_user_model
from rest_framework import generics, permissions

from .serializers import UserRegistrationSerializer, UserSerializer

# Optional: enable JWT endpoints if using rest_framework_simplejwt
# from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

User = get_user_model()


class CurrentUserView(generics.RetrieveAPIView):
    """
    Retrieve the currently authenticated user.

    Usage:
        - GET /users/me/
        - Requires authentication (e.g., JWT or session).
    """

    serializer_class = UserSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_object(self):
        return self.request.user


class RegisterView(generics.CreateAPIView):
    """
    Register a new user with email and password.

    Usage:
        - POST /users/register/
        - Body: { "email": "...", "password": "...", "first_name": "...", "last_name": "..." }
    """

    serializer_class = UserRegistrationSerializer
    permission_classes = [permissions.AllowAny]
    queryset = User.objects.all()
