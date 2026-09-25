#!/bin/bash
# scripts/healthcheck.sh

URL="http://localhost:80/health"
MAX_RETRIES=5
COUNT=0

echo "Starting Healthcheck for $URL..."

while [ $COUNT -lt $MAX_RETRIES ]; do
    # Grab just the HTTP status code (e.g., 200, 404, 500)
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" $URL)
    
    if [ "$STATUS" -eq 200 ]; then
        echo "✅ Healthcheck Passed! (HTTP 200)"
        exit 0
    else
        echo "⏳ Attempt $((COUNT+1)) failed (HTTP $STATUS). Retrying in 2 seconds..."
        sleep 2
        COUNT=$((COUNT+1))
    fi
done

echo "❌ Healthcheck Failed after $MAX_RETRIES attempts."
exit 1