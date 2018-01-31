#!/usr/bin/env bash
cd /opt/codedeploy-agent/deployment-root/$DEPLOYMENT_GROUP_ID/$DEPLOYMENT_ID/deployment-archive
mix phx.server
