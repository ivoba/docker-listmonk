# Listmonk Docker image
Image uses *envsubst* to get ENV vars into config.toml.sample.  
This is currently not supported by official image.

## Dev docker-compose
Run once

    docker-compose run app sh

and inside container to install the db

    envsubst < config.toml.sample > config.toml && ./listmonk --install

Then run `docker-compose up`

## Build
We use automated builds from https://cloud.docker.com
