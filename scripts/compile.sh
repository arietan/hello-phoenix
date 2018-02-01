#!/usr/bin/env bash

cd /opt/codedeploy-agent/deployment-root/$DEPLOYMENT_GROUP_ID/$DEPLOYMENT_ID/deployment-archive

if [$DEPLOYMENT_GROUP_NAME == 'helloPhoenix-Staging'] 
then
  aws s3 cp s3://helloerlang-secretsbucket-7apezuluts7h/creds_staging.txt .
  eval $(cat creds.txt | sed 's/^/export /')
  rm creds.txt
fi

# Install deps
mix local.hex --force
mix local.rebar --force
mix deps.get
cd assets && npm install
cd ..
mix ecto.create
