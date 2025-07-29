from django.contrib.auth import get_user_model
from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase

User = get_user_model()


class CustomUserTests(APITestCase):
    """Tests for custom user registration and authentication."""

    def setUp(self):
        """Create a sample user for authentication tests."""
        self.user = User.objects.create_user(
            email="test@example.com",
            password="testpass123",
            first_name="Test",
            last_name="User",
        )
        self.register_url = reverse("register")
        self.token_url = reverse("token_obtain_pair")
        self.me_url = reverse("current_user")

    def test_register_user(self):
        """Test registering a new user via the register endpoint."""
        data = {
            "email": "newuser@example.com",
            "password": "securepass123",
            "first_name": "New",
            "last_name": "User",
        }
        response = self.client.post(self.register_url, data, format="json")
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertIn("id", response.data)
        self.assertEqual(response.data["email"], data["email"])

    def test_obtain_jwt_token(self):
        """Test obtaining a JWT token with valid credentials."""
        data = {"email": "test@example.com", "password": "testpass123"}
        response = self.client.post(self.token_url, data, format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertIn("access", response.data)
        self.assertIn("refresh", response.data)

    def test_get_current_user(self):
        """Test retrieving the current authenticated user."""
        # First, obtain a token
        token_response = self.client.post(
            self.token_url,
            {"email": "test@example.com", "password": "testpass123"},
            format="json",
        )
        token = token_response.data["access"]

        # Use the token to authenticate
        self.client.credentials(HTTP_AUTHORIZATION=f"Bearer {token}")
        response = self.client.get(self.me_url)

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data["email"], "test@example.com")
