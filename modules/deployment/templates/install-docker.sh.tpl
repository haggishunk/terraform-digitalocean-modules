#!/bin/env bash

# install docker
curl -sSL https://get.docker.com | sh -

# add user to docker group
if test -n ${DOCKER_USER}; then
    usermod -aG docker ${DOCKER_USER}
fi
