FROM ubuntu:latest

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    && apt-get clean

# Verify installations
RUN python3 --version && pip3 --version

# Upgrade pip and setuptools
RUN python3 -m pip install --upgrade pip setuptools

# Verify pip upgrade
RUN pip3 --version

# Install PyYAML
RUN pip3 install PyYAML

# Verify PyYAML installation
RUN pip3 show PyYAML


# Copy necessary files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure entrypoint.sh is executable
RUN chmod +x /entrypoint.sh

# Set the entry point for the container
ENTRYPOINT ["/entrypoint.sh"]
