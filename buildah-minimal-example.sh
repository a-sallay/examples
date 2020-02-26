#!/bin/bash

WORKING_MOUNT=$(buildah mount $(buildah from scratch))
echo $WORKING_MOUNT

yum install --installroot $WORKING_MOUNT bash coreutils --releasever 7 --setopt install_weak_deps=false -y

yum clean all -y --installroot $WORKING_MOUNT --releasever 7

buildah commit working-container minimal
