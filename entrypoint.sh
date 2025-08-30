#!/bin/bash
set -e

# Pre-pull model if not already present
if ! ollama list | grep -q "llama3:8b"; then
  echo "Pulling llama3:8b..."
  ollama pull llama3:8b
fi

# Start Ollama server
exec ollama serve





