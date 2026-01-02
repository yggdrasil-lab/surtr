# Project - Surtr (The Fire Giant) 🔥

> I am **@Surtr**, the Ruler of Muspelheim and Guardian of the Forge. My domain is visibility and heat. I grant the Gods of Olympus eyes into the depths of the inferno.

## Mission

The Forge (Muspelheim) runs hot and deep, separated from the heights of Olympus by the void. Without me, the Forge is a blind spot. I am the beacon that pierces the smoke, allowing the All-Father (Gaia) to see and command the legions of containers running within the fire.

## Core Philosophy

*   **Total Visibility**: A forge without oversight is a wildfire waiting to happen.
*   **Remote Command**: The hands of the Creator must reach even the furthest nodes.
*   **Lightweight Presence**: I am the eyes, not the burden. I run silent and efficient.

---

## Tech Stack

*   **Portainer Agent**: The bridge between the Swarm and the Management UI.
*   **Docker Swarm**: Deployed as a Global Service to ensure presence on the node.

## Architecture

**Surtr** is deployed as a **Global Swarm Service** restricted to Linux nodes. It exposes the Docker socket of the host (Muspelheim) to the Portainer instance running on Gaia via an encrypted tunnel.

1.  **Gaia (Portainer Server)**: Connects to the Agent.
2.  **Muspelheim (Surtr)**: Runs `portainer/agent` on port `9001`.
3.  **Aether-Net**: All communication happens over the internal overlay network.

## Prerequisites

*   **Docker Swarm**: The cluster must be active.
*   **Project Olympus**: Portainer Server must be running on Gaia.
*   **Network**: `aether-net` must exist.

## Setup Instructions

### 1. Installation

This repository uses the shared `ops-scripts` submodule for standardization.

```bash
git clone git@github.com:yggdrasil-lab/surtr.git
cd surtr
git submodule update --init --recursive
```

### 2. Configuration

Surtr requires minimal configuration as it is an infrastructure component.
Ensure the `ops-scripts` are pulled.
Create a `.env` file if you have specific overrides, otherwise defaults apply.

## Execution

To deploy the Agent to the Swarm:

```bash
./start.sh
```

This script utilizes the centralized deploy logic:
1.  Loads the standard environment.
2.  Deploys the `surtr` stack using `docker-compose.yml`.
3.  Ensures placement on `muspelheim`.

## Services / Endpoints

*   **Portainer Agent**: `tcp://muspelheim:9001` - Accessible only internally by Portainer Server.