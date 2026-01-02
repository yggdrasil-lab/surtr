#!/bin/bash

# Deploy to Swarm
docker stack deploy -c docker-compose.yml surtr
