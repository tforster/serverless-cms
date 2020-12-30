#!/usr/bin/env bash

###################################################################################################################################
#
# Completes the deployment of a new container 
#
# - Intended to be run from inside the production container as the container is instantiated.
# - Echoes intended to aid tracing in Lightsail deployment logs
#
# @usage ./run.sh
#
###################################################################################################################################

echo Installing NPM packages...
yarn install --verbose --network-timeout 100000

echo Building Strapi...
yarn build

echo Starting Strapi...
yarn start
