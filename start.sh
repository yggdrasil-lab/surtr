#!/bin/bash

# Deploy the stack to the Swarm
docker stack deploy -c docker-compose.yml surtr
