#!/bin/sh
set -e

MODEL="${OLLAMA_MODEL:-llama3}"
MOUNT_PATH="${OLLAMA_MOUNT_PATH:-/root/.ollama}"

# ensure mount path exists
mkdir -p "${MOUNT_PATH}"

# set Ollama home
export OLLAMA_HOME="${MOUNT_PATH}"

# Always pull the model (safe because Ollama skips if already cached)
echo "Pulling model: ${MODEL}"
ollama pull "${MODEL}"

echo "Starting Ollama server..."
ollama serve --host 0.0.0.0 --port 11434


