#!/bin/sh
set -e

MODEL="${OLLAMA_MODEL:-llama3}"
MOUNT_PATH="${OLLAMA_MOUNT_PATH:-/root/.ollama}"

# ensure mount path exists
mkdir -p "${MOUNT_PATH}"
export OLLAMA_HOME="${MOUNT_PATH}"

echo "Pulling model: $MODEL"
ollama pull "$MODEL"

echo "Starting Ollama server..."
# run full API server, bound to 0.0.0.0 so Render can access it
OLLAMA_HOST=0.0.0.0 ollama serve




