#!/bin/sh
set -e

MODEL="${OLLAMA_MODEL:-llama3}"
MOUNT_PATH="${OLLAMA_MOUNT_PATH:-/root/.ollama}"

# Ensure mount path exists
mkdir -p "${MOUNT_PATH}"
export OLLAMA_HOME="${MOUNT_PATH}"

echo "Checking and pulling model: ${MODEL} ..."
ollama pull "${MODEL}"

echo "Starting Ollama server on 0.0.0.0:11434 ..."
exec ollama serve --host 0.0.0.0 --port 11434

