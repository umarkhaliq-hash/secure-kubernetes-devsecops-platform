
#!/usr/bin/env bash
set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ENV_FILE="${ENV_FILE:-${ROOT_DIR}/.env}"
COMPOSE_FILE="${COMPOSE_FILE:-${ROOT_DIR}/docker-compose.yml}"

if [[ ! -f "${ENV_FILE}" ]]; then
  echo "[error] Missing environment file: ${ENV_FILE}"
  echo "[info] Copy .env.example to .env and configure it."
  exit 1
fi

if [[ ! -f "${COMPOSE_FILE}" ]]; then
  echo "[error] Docker Compose file not found."
  exit 1
fi

if ! command -v docker >/dev/null 2>&1; then
  echo "[error] Docker is not installed."
  exit 1
fi

if ! docker compose version >/dev/null 2>&1; then
  echo "[error] Docker Compose is unavailable."
  exit 1
fi

# Validate variables without executing the environment file as shell code.
required_vars=(
  DJANGO_SECRET_KEY
  POSTGRES_DB
  POSTGRES_USER
  POSTGRES_PASSWORD
)

for var in "${required_vars[@]}"; do
  value="$(
    docker run --rm \
      --env-file "${ENV_FILE}" \
      alpine:3.21 \
      printenv "${var}" 2>/dev/null
  )" || value=""

  if [[ -z "${value}" ]]; then
    echo "[error] Missing or empty variable: ${var}"
    exit 1
  fi
done

if ! docker compose \
  --env-file "${ENV_FILE}" \
  -f "${COMPOSE_FILE}" \
  config --quiet; then
  echo "[error] Docker Compose configuration is invalid."
  exit 1
fi

echo "[success] Environment and Docker Compose validation passed."
