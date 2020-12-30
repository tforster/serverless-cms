
# Note: strapi/base is just a wrapper around NodeJS and includes NO Strapi code whatsoever!
FROM strapi/base:alpine

# Set /techsmarts/cms as the new working directory
WORKDIR /techsmarts/cms

# Copy the latest contents from ./src. Note that node_modules is deliberately .dockerignored.
COPY ./src /techsmarts/cms

# Copy the init script that will eventually be responsible for optionally restoring an S3 backup
COPY ./scripts/run.sh /techsmarts/cms

# Set the init script to executable
RUN chmod a+x /techsmarts/cms/run.sh

# Set production mode. This implies that this image will NOT be able to do auto-restarts and modify content types.
ENV NODE_ENV production

# Be consistent and expose Strapi's default port of 1337
EXPOSE 1337

# Execute the init script which is also responsible for starting Strapi
CMD ["/techsmarts/cms/run.sh"]
