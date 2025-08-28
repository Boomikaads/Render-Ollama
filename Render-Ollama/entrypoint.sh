#!/bin/sh
set -e

MODEL="${OLLAMA_MODEL:-llama3}"
MOUNT_PATH="${OLLAMA_MOUNT_PATH:-/root/.ollama}"

# ensure mount path exists
mkdir -p "${MOUNT_PATH}"

# If model not present, download it to persistent disk
if [ ! -d "${MOUNT_PATH}/models/${MODEL}" ]; then
  echo "Model ${MODEL} not found under ${MOUNT_PATH}. Pulling..."
  # Ensure ollama uses the same storage directory
  export OLLAMA_HOME="${MOUNT_PATH}"
  ollama pull "${MODEL}"
else
  echo "Model ${MODEL} already present at ${MOUNT_PATH}/models/${MODEL}"
fi

echo "Starting Ollama server..."
# Serve on all interfaces (Render will route traffic); bind to port 11434
ollama serve --host 0.0.0.0 --port 11434
