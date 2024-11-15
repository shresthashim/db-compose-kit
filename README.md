# Database Docker Compose Setup

This repository contains Docker Compose files for setting up multiple databases (MySQL, PostgreSQL, MongoDB, and Redis) in isolated containers, along with their respective admin tools (Adminer for MySQL/PostgreSQL and RedisInsight for Redis).

## Requirements

Before using this setup, ensure you have the following installed:

1. **Docker**: [Install Docker](https://docs.docker.com/get-docker/)
2. **Docker Compose**: [Install Docker Compose](https://docs.docker.com/compose/install/)
3. **Git**: To clone the repository and manage your version control.

### Verifying Installation

Once installed, verify Docker and Docker Compose are working correctly by running:

```bash
docker --version
docker compose --version
```

### Getting Started

Clone the repository in your device:

```bash
git clone https://github.com/yourusername/database-setup.git
cd database-setup
```

### Start Script File

```bash
./start_database.sh
```

The script will prompt you to select a database to start:

1 for MySQL
2 for PostgreSQL
3 for MongoDB
4 for Redis.
Once you select a database, the script will automatically navigate to the correct folder and run docker compose up -d to start the container in detached mode.

#### Access Admin Tools
For MySQL and PostgreSQL, Adminer is available at http://localhost:8080.

For Redis, RedisInsight is available at http://localhost:8001.

### Stopping the Containers
To stop all the containers, run:

```bash
docker compose down
```
