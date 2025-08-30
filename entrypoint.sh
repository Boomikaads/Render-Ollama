#!/bin/bash
set -e

echo "Starting Ollama on Render..."

# Ensure model is available (double-check at runtime)
if ! ollama list | grep -q "llama3:8b"; then
  echo "Model not found, pulling llama3:8b..."
  ollama pull llama3:8b
else
  echo "Model llama3:8b already present."
fi

# Start Ollama server
exec ollama serve





