#!/bin/bash

APP_URL="http://ec2-54-211-142-255.compute-1.amazonaws.com:3000"

# Perform a simple health check to verify that the application is running and responding
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL")

# Debugging with HTTP_STATUS
echo "HTTP Status: $HTTP_STATUS"
RESPONSE=$(curl -s "$APP_URL")
echo "Response: $RESPONSE"

if [ "$HTTP_STATUS" -eq 200 ]; then
  echo "Application health check succeeded. Deployment was successful."
  exit 0
else
  echo "Application health check failed. Deployment was not successful."
  exit 1
fi
