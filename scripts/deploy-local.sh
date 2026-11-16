
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

if ! command -v docker >/dev/null 2>&1; then
  echo "[error] Docker is not installed."
  exit 1
fi

if ! docker info >/dev/null 2>&1; then
  echo "[error] Docker daemon is not running."
  exit 1
fi

echo "[info] Validating configuration..."

ENV_FILE="${ENV_FILE}" \
COMPOSE_FILE="${COMPOSE_FILE}" \
bash "${ROOT_DIR}/scripts/verify.sh"

echo "[info] Building and starting services..."

docker compose \
  --env-file "${ENV_FILE}" \
  -f "${COMPOSE_FILE}" \
  up --build -d --wait

echo "[success] DevSecOps platform started successfully."
echo "[info] Frontend: http://localhost:8085"
echo "[info] Backend: http://localhost:8005"
echo "[info] Database: internal Docker network"
