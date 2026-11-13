import os

SECRET_KEY = os.environ.get("DJANGO_SECRET_KEY", "local-only")
DEBUG = False
ALLOWED_HOSTS = os.environ.get(
    "DJANGO_ALLOWED_HOSTS", "localhost,127.0.0.1"
).split(",")

ROOT_URLCONF = "config.urls"
INSTALLED_APPS = ["django.contrib.contenttypes"]
MIDDLEWARE = ["django.middleware.common.CommonMiddleware"]
TEMPLATES = []
WSGI_APPLICATION = "config.wsgi.application"

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.postgresql",
        "NAME": os.environ.get("POSTGRES_DB", "appdb"),
        "USER": os.environ.get("POSTGRES_USER", "appuser"),
        "PASSWORD": os.environ.get("POSTGRES_PASSWORD", ""),
        "HOST": os.environ.get("POSTGRES_HOST", "database"),
        "PORT": "5432",
    }
}

DEFAULT_AUTO_FIELD = "django.db.models.BigAutoField"
