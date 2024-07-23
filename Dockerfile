FROM ubuntu:latest

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git

# Upgrade pip to the latest version
RUN pip3 install --upgrade pip

# Install PyYAML
RUN pip3 install PyYAML

# Copy necessary files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure entrypoint.sh is executable
RUN chmod +x /entrypoint.sh

# Set the entry point for the container
ENTRYPOINT ["/entrypoint.sh"]
