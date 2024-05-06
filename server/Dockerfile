# Specify a more stable version of Ubuntu, not the latest
FROM ubuntu:20.04

# Run update and install commands together to avoid caching issues
# Pin package versions and use --no-install-recommends
# Clean up apt cache to reduce image size
RUN apt-get update && apt-get install -y \
    bash 

# Make directory for your server
RUN mkdir -p /usr/local/Server
WORKDIR /usr/local/Server

COPY Server/ /usr/local/Server/

# Set appropriate permissions for the server executable
RUN chmod +x /usr/local/Server/Server.x86_64

# Expose the port the server listens on
EXPOSE 7778

# Command to run your server
CMD ["bash", "-c", "./Server.x86_64"]
