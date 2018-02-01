#!/usr/bin/env bash

cd /opt/codedeploy-agent/deployment-root/$DEPLOYMENT_GROUP_ID/$DEPLOYMENT_ID/deployment-archive

if [ "$DEPLOYMENT_GROUP_NAME" == "helloPhoenix-Staging" ]
then
  aws s3 cp s3://helloerlang-secretsbucket-7apezuluts7h/creds_staging.txt .
  eval $(cat creds_staging.txt | sed 's/^/export /')
  rm creds_staging.txt
  MIX_ENV=dev
fi

if [ "$DEPLOYMENT_GROUP_NAME" == "helloPhoenix-Production" ]
then
  aws s3 cp s3://helloerlang-secretsbucket-7apezuluts7h/creds_prod.txt .
  eval $(cat creds_prod.txt | sed 's/^/export /')
  rm creds_prod.txt
  MIX_ENV=prod
fi

# Install deps
mix local.hex --force
mix local.rebar --force
mix deps.get
cd assets && npm install
cd ..
mix ecto.create
