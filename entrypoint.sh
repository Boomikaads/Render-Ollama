#!/bin/bash
set -e

# Pull the model before starting the server
ollama pull llama3:8b

# Start Ollama server on Render's assigned port
OLLAMA_HOST=0.0.0.0:$PORT ollama serve





