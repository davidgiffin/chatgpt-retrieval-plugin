#!/bin/sh

if [ ! -z "$APP_INGRESS_URL" ]; then
  cat .well-known/ai-plugin.json | sed s"/https:\/\/.*\//$APP_INGRESS_URL\//" > /tmp/ai-plugin.json
  mv /tmp/ai-plugin.json .well-known/ai-plugin.json
fi

uvicorn server.main:app --host 0.0.0.0 --port ${PORT:-${WEBSITES_PORT:-8080}}
