#!/bin/sh

if [ ! -z "$APP_INGRESS_URL" ]; then
  sed -i -E "s|https://[^/]+|$APP_INGRESS_URL|" .well-known/ai-plugin.json
fi

uvicorn server.main:app --host 0.0.0.0 --port ${PORT:-${WEBSITES_PORT:-8080}}
