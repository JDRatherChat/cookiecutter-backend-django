from django.shortcuts import render


def home(request):
    """Render a simple welcome page."""
    return render(request, "core/home.html")
