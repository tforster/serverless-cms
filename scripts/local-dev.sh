#!/bin/sh

###################################################################################################################################
#
# Starts the Strapi server in development mode
#
# - Uses the Strapi CLI from the official Strapi Docker image
#
# TODO: x-www-browser may need to include a platform check and MacOS specific code
#
# @usage ./local-dev.sh
#
###################################################################################################################################

# Start Strapi container in development mode 
docker run -d -v `pwd`/src:/srv/app -p 1337:1337 strapi/strapi:alpine strapi develop

# Open the admin page in the default browser
x-www-browser http://localhost:1337/admin
