FROM ollama/ollama:latest

ENV OLLAMA_HOST=0.0.0.0:11434
ENV OLLAMA_MODELS=/root/.ollama/models

# Pre-pull llama3:8b during build
RUN ollama pull llama3:8b

EXPOSE 11434

CMD ["ollama", "serve"]
