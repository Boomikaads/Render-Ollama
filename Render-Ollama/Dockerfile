# Use the official Ollama image (keeps runtime up to date)
FROM ollama/ollama:latest

# Optional: set a default model name (can be overridden in Render env)
ENV OLLAMA_MODEL=llama3

# Copy startup script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose the default Ollama port
EXPOSE 11434

# Start the entrypoint (pull model if missing, then serve)
ENTRYPOINT ["/entrypoint.sh"]
