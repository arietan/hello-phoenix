#!/usr/bin/env bash
cd /opt/codedeploy-agent/deployment-root/$DEPLOYMENT_GROUP_ID/$DEPLOYMENT_ID/deployment-archive

kill -9 $(pidof beam.smp)
