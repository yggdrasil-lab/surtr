# Proxy Stack (Portainer Agent)

This project deploys the Portainer Agent to a specific node (`muspelheim`) in the Docker Swarm, connected to the `aether-net` overlay network.

## Components

### Portainer Agent (`portainer/agent`)
Allows the main Portainer instance to manage this node.

### Portainer Agent (`portainer/agent`)
Allows the main Portainer instance to manage the Swarm cluster.

- **Mode**: Global (Runs on all nodes).
- **Ports**: Exposes `9001`.

## Prerequisites

- **Swarm**: Docker Swarm must be active.

## Deployment

The deployment is managed via `docker stack deploy`.

```bash
./start.sh
```

**Command:**
`docker stack deploy -c docker-compose.yml surtr`

## CI/CD Service

This repository includes a GitHub Action (`.github/workflows/deploy.yml`) configured to run on a self-hosted runner tagged `gaia` (manager node). It triggers on pushes to the default branch.
