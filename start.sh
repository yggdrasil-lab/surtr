#!/bin/bash

# Stop and remove existing containers and orphans
docker compose down --remove-orphans

# Start the stack
docker compose up -d --remove-orphans
