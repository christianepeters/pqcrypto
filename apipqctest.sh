#!/bin/bash

# Define your project ID variable to satisfy gcloud's context requirement
PROJECT_ID="FILL_IN_YOUR_PROJECT_ID"

echo "Fetching global list of Google APIs..."

# 1. We use the project ID to authorize the global 'available' list request
# 2. Filtering for 'googleapis.com' to target public API endpoints
SERVICES=$(gcloud services list --available --project="$PROJECT_ID" --format="value(config.name)" 2>/dev/null | grep "googleapis.com")

if [ -z "$SERVICES" ]; then
    echo "Error: Could not fetch services. Check your PROJECT_ID and gcloud auth."
    exit 1
fi

echo "Starting Global PQC Handshake Test (X25519MLKEM768)..."
echo "------------------------------------------------------"

for api in $SERVICES; do
  # Pipe 'Q' to quit bssl after handshake and grep for the PQC group
  if echo "Q" | ./bssl client -connect "${api}:443" -server-name "${api}" -curves X25519MLKEM768 2>&1 | grep -q "X25519MLKEM768"; then
    echo "$api: PQC OK"
  else
    echo "$api: FAILED"
  fi
done
