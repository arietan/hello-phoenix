#!/usr/bin/env bash
if [[ $(pidof beam.smp) ]] 
then
  kill -9 $(pidof beam.smp)
fi
