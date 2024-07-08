#!/bin/bash

# Wait for the PostgreSQL server to be available
dockerize -wait tcp://${POSTGRES_SERVER}:${POSTGRES_PORT} -timeout 60s

# Run the prestart script
poetry run ./prestart.sh

# Start the FastAPI application
exec poetry run uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
