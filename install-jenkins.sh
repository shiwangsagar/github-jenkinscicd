#!/bin/bash

docker run --name jenkins -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):$(which docker) brainupgrade/jenkins:docker20221110
