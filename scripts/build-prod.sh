#!/bin/sh

###################################################################################################################################
#
# Builds a production (AWS Lightsail Container) ready Docker image
#
# - Builds and tags a new Docker image
# - Uses Lightsail plugin for AWS CLI to push the image to the Lightsail container registry
# - Note that you will need to edit this script to add the AWS values for now
#
# TODO: Replace hardcoded parameter values with parsed .env file values.
#
# @usage ./build-prod.sh
#
###################################################################################################################################

AWS_PROFILE=
AWS_REGION=
SERVICE_NAME=

TAG=serverlesscms
IMAGE=$TAG:latest
LABEL=$TAG

# Build new without any cached artifacts
docker build --no-cache --force-rm -t $TAG -f docker/prod.Dockerfile .

# Push the image to LightSails (mysterious) container registry
aws lightsail push-container-image \
  --region $AWS_REGION \
  --service-name $SERVICE_NAME \
  --label $LABEL \
  --image $IMAGE \
  --profile $AWS_PROFILE

# Navigate to the AWS LightSail console to complete the deployment. This will be scripted here in the future.
x-www-browser https://lightsail.aws.amazon.com/ls/webapp/$AWS_REGION/container-services/$SERVICE_NAME/deployments


