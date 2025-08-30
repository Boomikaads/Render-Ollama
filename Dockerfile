# Base Ollama image (already has the server installed)
FROM ollama/ollama:latest

# Set environment variables
ENV OLLAMA_HOST=0.0.0.0:11434
ENV OLLAMA_MODELS=/root/.ollama/models

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Preload llama3:8b at build time
RUN ollama pull llama3:8b

EXPOSE 11434

ENTRYPOINT ["/entrypoint.sh"]
