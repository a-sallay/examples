#!/bin/bash

#Make directory to represent a large cache on the host system
mkdir /data

#Create some data as an example
dd if=/dev/zero of=/data/test.bin bs=1MB count=100

#Initialize a working container from fedora
buildah from fedora

#Mount the working container so it can be modified
buildah mount fedora-working-container

# Use the buildah run command to mount the example data, relabel for SElinux (Z option)
# and run a command that uses a small part of the example data

buildah run -v /data:/data:Z fedora-working-container dd if=/data/test.bin of=/etc/small-test.bin bs=100 count=2

# Commit the image
buildah commit fedora-working-container fedora-data

# Clean up working files
buildah delete -a