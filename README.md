# Proxy Stack (Portainer Agent)

This project deploys the Portainer Agent to a specific node (`muspelheim`) in the Docker Swarm, connected to the `aether-net` overlay network.

## Components

### Portainer Agent (`portainer/agent`)
Allows the main Portainer instance to manage the resources on the `muspelheim` node and the cluster.

- **Placement**: Constrained to run only on `node.hostname == muspelheim`.
- **Mode**: Global (one instance per matching node).
- **Ports**: Exposes `9001`.

## Prerequisites

- **Swarm**: The target environment must be a Docker Swarm.
- **Network**: The external overlay network `aether-net` must exist.
- **Node Label**: The target node must have the hostname `muspelheim`.

## Deployment

The deployment is managed via `docker stack deploy`.

```bash
./start.sh
```

**Command:**
`docker stack deploy -c docker-compose.yml surtr`

## CI/CD Service

This repository includes a GitHub Action (`.github/workflows/deploy.yml`) configured to run on a self-hosted runner tagged `gaia` (manager node). It triggers on pushes to the default branch.
