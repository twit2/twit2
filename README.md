# Twit2
Main Twit2 repository.

## For Developers

To setup a dev environment, ensure you have the following installed:

```
docker, nodejs, npm
```

### Getting started

If you simply want to start the core stuff and handle the microservices/frontend yourself, you can simply run `docker compose up proxy krakend rabbitmq`.

Otherwise, run `fetch-projects.sh` to get the latest projects and `start-dev.sh` to start Twit2 in dev mode.

## Production

If you are running Twit2 in production, simply run `start-prod.sh`.

## Example files

This repository includes a number of example files you must change. If you want to use the default deployment settings, you can simply rename the files without changing anything (except `nginx/sites-enabled`, which you must configure per environment).

The target files will always have `.example` removed from them (e.g. `krakend.example.json` -> `krakend.json`).

Example files should be kept intact, as they are part of the git tree, whilst the custom changes are not.

### etc/krakend/krakend.example.json

This file contains the API gateway URL mappings.

You should modify it if you plan to run the microservices on other hosts.

### etc/nginx/sites-enabled.example

You may want to change how nginx handles serving the backend/frontend.