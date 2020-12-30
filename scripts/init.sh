#!/bin/sh

###################################################################################################################################
#
# Initialises a new Strapi-based CMS project
#
# - Uses the Strapi CLI from the official Strapi Docker image
#
# @usage ./init.sh
#
###################################################################################################################################

# Create a fresh Strapi app into the ./src folder
docker run -it -v `pwd`/src:/srv/app strapi/strapi:alpine strapi new src --quickstart --no-run

# Install the GraphQL plugin
docker run -it -v `pwd`/src:/srv/app strapi/strapi:alpine strapi install graphql

# Start Strapi in development mode 
sh scripts/local-dev.sh
