# Specify a more stable version of Ubuntu, not the latest
FROM ubuntu:20.04

# Run update and install commands together to avoid caching issues
# Pin package versions and use --no-install-recommends
# Clean up apt cache to reduce image size
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash=5.0-6ubuntu1.1 \
    git=1:2.25.1-1ubuntu3.4 \
    && rm -rf /var/lib/apt/lists/*

# Make directory for your server
RUN mkdir -p /usr/local/Server
WORKDIR /usr/local/Server

# Clone your project repository
RUN git clone https://github.com/Yura11/docker_deploy.git .

# Set appropriate permissions for the server executable
RUN chmod +x /usr/local/Server/Server/Server.x86_64

# Expose the port the server listens on
EXPOSE 7777

# Command to run your server
CMD ["bash", "-c", "./Server/Server.x86_64"]
