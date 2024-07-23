FROM ubuntu:latest

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git 

RUN apt-get install -y python3-yaml 

# Copy necessary files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Set the entry point for the container
ENTRYPOINT ["/entrypoint.sh"]
