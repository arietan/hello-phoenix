#!/usr/bin/env bash

cd /opt/codedeploy-agent/deployment-root/$DEPLOYMENT_GROUP_ID/$DEPLOYMENT_ID/deployment-archive

# Install deps
mix local.hex --force
mix local.rebar --force
mix deps.get
cd assets && npm install
mix ecto.migrate
