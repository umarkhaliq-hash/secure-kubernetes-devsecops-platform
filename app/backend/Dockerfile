FROM python:3.12-slim

WORKDIR /app

RUN groupadd --system app && useradd --system --gid app app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

USER app
EXPOSE 8000

CMD ["gunicorn", "config.wsgi:application", "--bind", "0.0.0.0:8000"]
