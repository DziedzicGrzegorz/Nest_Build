# My Goal

My objective is to set up an environment for running tests both locally and on GitHub Actions using Docker images.
This is to automate the process and make it easier to maintain.

## Prerequisites

Before you begin, ensure you have the following installed:

- **Node.js**: We recommend using [`nvs`](https://github.com/jasongin/nvs) on Windows and [`nvm`](https://github.com/nvm-sh/nvm) on MacOS.
- **act**: You can download it from the [official GitHub repository](https://github.com/nektos/act).
- **Docker**: You can download it from the [official Docker website](https://www.docker.com/products/docker-desktop).

## Committing Code

When committing, the `act` command is run in the `.git/hooks/pre-commit` hook to verify the Docker containers are running correctly.

