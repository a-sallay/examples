#!/bin/bash

# Initialize a working container from fedora
buildah from fedora

# Mount the working container for modification
buildah mount fedora-working-container

# Create a new file in the mounted container
echo "hello world" > $(buildah mount fedora-working-container)/etc/hello.conf

# Commit the container into an image
buildah commit fedora-working-container fedora-hello

# Clean up build files
buildah delete -a