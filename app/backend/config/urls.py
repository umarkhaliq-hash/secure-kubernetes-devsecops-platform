from django.http import JsonResponse
from django.urls import path

def health(request):
    return JsonResponse({
        "status": "healthy",
        "service": "django-api"
    })

urlpatterns = [
    path("", health),
    path("health/", health),
]
