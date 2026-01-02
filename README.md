# Proxy Stack (Portainer Agent)

This project deploys the Portainer Agent to a specific node (`muspelheim`) in the Docker Swarm, connected to the `aether-net` overlay network.

## Components

### Portainer Agent (`portainer/agent`)
Allows the main Portainer instance to manage this node.

- **Type**: Standalone Docker container.
- **Ports**: Exposes `9001`.
- **Environment**: `AGENT_CLUSTER_ADDR=portainer-agent` (Required to prevent invalid Swarm DNS lookups).

## Prerequisites

- **Docker**: Docker Engine and Docker Compose (v2) must be installed.

## Deployment

The deployment is managed via `docker compose`.

```bash
./start.sh
```

**Command:**
`docker compose up -d`

## CI/CD Service

This repository includes a GitHub Action (`.github/workflows/deploy.yml`) configured to run on a self-hosted runner tagged `muspelheim`. It triggers on pushes to the default branch.
