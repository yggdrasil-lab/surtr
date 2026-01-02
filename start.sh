#!/bin/bash
set -e
# Usage: ./scripts/deploy.sh <STACK_NAME> [COMPOSE_FILES...]
./scripts/deploy.sh --skip-build "surtr" docker-compose.yml
