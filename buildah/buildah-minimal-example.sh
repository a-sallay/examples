#!/bin/bash

#Initialize a working container from scratch to build from

WORKING_MOUNT=$(buildah mount $(buildah from scratch))
echo $WORKING_MOUNT

#Install using yum from the host (outside the container)
yum install --installroot $WORKING_MOUNT bash coreutils --releasever 7 --setopt install_weak_deps=false -y
yum clean all -y --installroot $WORKING_MOUNT --releasever 7

#Commit the image
buildah commit working-container minimal

#Clean up build files
buildah delete -a
