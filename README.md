# Proxy Stack (Traefik & Portainer)

This project deploys a secure proxy stack acting as a bridge to a main Traefik and Portainer instance running on another server. It connects to the `aether-net` overlay network.

## Components

### 1. Socket Proxy (`tecnativa/docker-socket-proxy`)
Provides secure, read-only access to the Docker socket for Traefik. It filters requests to ensure Traefik can only *read* configuration (discover services, networks, etc.) without having permission to execute or modify containers.

**Enabled Permissions (Read-Only):**
- `CONTAINERS`
- `SERVICES`
- `TASKS`
- `NETWORKS`
- `NODES`

### 2. Portainer Agent (`portainer/agent`)
Allows the main Portainer instance to manage this node/cluster.
- **Configured Environment**: `AGENT_CLUSTER_ADDR=portainer-agent` is set to prevent DNS lookup errors (`tasks.<name>`) when deploying via Docker Compose on a node that is part of a Swarm.

## Prerequisites

- **Network**: The external overlay network `aether-net` must exist.
- **Docker**: Docker Engine and Docker Compose (v2) must be installed.

## Configuration

Copy the example environment file if you need to customize variables (though none are strictly required by default):

```bash
cp .env.example .env
```

## Deployment

A helper script is provided to safely deploy the stack. It will remove orphans and ensure a clean state before starting.

```bash
./start.sh
```

**What the script does:**
1. Runs `docker compose down --remove-orphans`
2. Runs `docker compose up -d --remove-orphans`

## CI/CD Service

This repository includes a GitHub Action (`.github/workflows/deploy.yml`) configured to run on a self-hosted runner tagged `muspelheim`. It triggers on pushes to the default branch and automatically runs `./start.sh`.
