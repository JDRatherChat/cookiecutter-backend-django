from rest_framework.response import Response
from rest_framework.views import APIView


class HealthCheckView(APIView):
    """Simple health check endpoint."""

    def get(self, request):
        return Response({"status": "ok", "message": "API is working!"})
