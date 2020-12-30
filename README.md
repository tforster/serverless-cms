# Serverless CMS <!-- omit in toc -->

_A lightweight GraphQL CMS suitable for powering WebProducer built sites and applications._

- [Prerequisites](#prerequisites)
- [Setup and Configuration](#setup-and-configuration)
- [Usage](#usage)
- [Change Log](#change-log)
- [Meta](#meta)
- [Contributing](#contributing)

## Prerequisites

The versions listed for these prerequisites are current at the time of writing. More recent versions will likely work but "your mileage may vary".

- A good code editor
- Docker Desktop 3.0.0 with Docker Engine 20.10.0
- AWS CLI 2.11.4 (upgrade instructions [https://docs.amazonaws.cn/en_us/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-upgrade](https://docs.amazonaws.cn/en_us/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-upgrade))
- [AWS LightSail container services plugin](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-install-software)
- Git 2.29.2

## Setup and Configuration

1. Clone this repository as your new project

   ```sh
   git clone git@github.com:tforster/serverless-cms.git ~/dev/TechSmarts/Joy/ServerlessCMS
   ```

1. Create an environment file that contains the sensitive IAM secrets

   ```ini
   AWS_ACCESS_KEY_ID=
   AWS_SECRET_ACCESS_KEY=
   AWS_PROFILE=
   AWS_BUCKET=
   AWS_REGION=ca-central-1
   RESTORE_VERSION=
   ```

   _Note that we currently need both the AWS profile name and AWS access keys as each is used in a different script. The [putS3.sh](scripts/putS3.sh) script will be refactored in the future to extract the keys from the profile._

1. Initialise the environment.

   _Note that the [init.sh](scripts/init.sh) script will use the official Strapi Docker container to build a new Strapi instance into the /src folder, install the GraphQL plugin, start the development environment and open the admin account registration screen in your default browser._

   ```sh
   npm run init
   ```

1. Create the admin user account.

   _Note that these credentials will be persisted to production. As always, password best-practices prevail._

## Usage

1. Start the development environment if it is not already running. The [local-dev.sh](scripts/local-dev.sh) script will launch the same Strapi container with the contents of the /src folder bind mounted. It will also open the admin screen for login in your default browser.

   ```sh
   npm run start
   ```

1. Create users, roles, content types and date via the admin interface.
1. Package and push the current state as a new production Docker image to AWS LightSail. This image is NOT the same as the one used for development and is tuned to run in production mode unattended in an Amazon LightSail container.

   _Note that the image will contain the SQLite database as found in src/.tmp/data.db. Instructions will be provided soon describing how to set the `RESTORE_VERSION` environment variable to a date-stamped backup in S3 that will be fetched when the container starts._

   _Note that there is currently an improperly configured file created by Strapi called .strapi-updater.json. It is blocking our deploy script so we will remove it for now._

   ```sh
   sudo rm src/.strapi-updater.json
   npm run deploy
   ```

1. Navigate to the Amazon LightSail console to complete the deployment of this latest version.

   [https://lightsail.aws.amazon.com/ls/webapp/{AWS_REGION}/container-services/{container-service-name}/deployments](https://lightsail.aws.amazon.com/ls/webapp/{AWS_REGION}/container-services/{container-service-name}/deployments)

## Change Log

See [CHANGELOG.md](CHANGELOG.md)

## Meta

Troy Forster – @tforster – troy.forster@gmail.com

See [LICENSE.txt](LICENSE.txt) for more information.

[https://github.com/tforster/serverless-cms](https://github.com/tforster/serverless-cms)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)
