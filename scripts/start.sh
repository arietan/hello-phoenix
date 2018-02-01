#!/usr/bin/env bash
cd /opt/codedeploy-agent/deployment-root/$DEPLOYMENT_GROUP_ID/$DEPLOYMENT_ID/deployment-archive
MIX_ENV=$CUR_ENV mix phx.server > /dev/null 2>&1 &
