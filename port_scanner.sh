#!/bin/bash

# Simple Bash Port Scanner
# Author: Abhishek
# Usage: ./port_scanner.sh <host> <start_port> <end_port>

if [ $# -ne 3 ]; then
  echo "Usage: $0 <host> <start_port> <end_port>"
  exit 1
fi

HOST=$1
START_PORT=$2
END_PORT=$3

echo "Scanning host: $HOST"
echo "Ports: $START_PORT to $END_PORT"
echo "-----------------------------"

for ((port=START_PORT; port<=END_PORT; port++))
do
  timeout 1 bash -c "echo >/dev/tcp/$HOST/$port" 2>/dev/null
  if [ $? -eq 0 ]; then
    echo "Port $port is OPEN"
  fi
done

echo "Scan completed."