#!/bin/bash

# Base directory for the database services (relative to where the script is executed)
BASE_DIR="$(pwd)"

# Prompt user to choose a database
echo "Select the database to start:"
echo "1. MySQL"
echo "2. PostgreSQL"
echo "3. MongoDB"
echo "4. Redis"
read -p "Enter the number of your choice: " choice

# Determine the folder based on the choice
case $choice in
  1)
    SERVICE="mysql"
    ;;
  2)
    SERVICE="postgresql"
    ;;
  3)
    SERVICE="mongodb"
    ;;
  4)
    SERVICE="redis"
    ;;
  *)
    echo "Invalid choice. Exiting."
    exit 1
    ;;
esac

# Set the path to the selected docker-compose file
COMPOSE_FILE="$BASE_DIR/$SERVICE/docker-compose.yml"

# Debugging: print the path being checked
echo "Checking for $COMPOSE_FILE"

# Check if the docker-compose.yml file exists
if [ ! -f "$COMPOSE_FILE" ]; then
  echo "docker-compose.yml not found in $BASE_DIR/$SERVICE."
  exit 1
fi

# Navigate to the folder and run Docker Compose
echo "Starting $SERVICE with Docker Compose..."
(cd "$BASE_DIR/$SERVICE" && docker compose up -d)

# Check if the service started successfully
if [ $? -eq 0 ]; then
  echo "$SERVICE started successfully."
else
  echo "Failed to start $SERVICE."
  exit 1
fi
