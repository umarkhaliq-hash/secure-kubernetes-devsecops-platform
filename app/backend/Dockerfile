FROM python:3.12-slim

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --only-upgrade zlib1g \
    && dpkg-query -W zlib1g \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd --system app && useradd --system --gid app app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
RUN chown -R app:app /app && chmod -R u+rwX /app

USER app
EXPOSE 8000

CMD ["gunicorn", "config.wsgi:application", "--bind", "0.0.0.0:8000"]