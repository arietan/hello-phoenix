#!/usr/bin/env bash

# Install deps
mix local.hex --force
mix local.rebar --force
mix deps.get
cd assets && npm install
mix ecto.migrate
