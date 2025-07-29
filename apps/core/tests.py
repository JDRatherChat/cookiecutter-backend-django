from django.test import TestCase
from django.urls import reverse


class CoreTests(TestCase):
    def test_api_health(self):
        response = self.client.get(reverse("api-health"))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json()["status"], "ok")
