MySQL Backup using Restic
=========================
This is a Docker container image available at `innovate/restic-mysql` that will do a MySQL dump directly to Restic. We use this in a Kubernetes cron job to back up our MySQL servers.

## Tags
We use a multiarch build for the images where the architecture is set in the tag
```
innovate/restic-mysql:amd64-latest # x86-64/and64 build
innovate/restic-mysql:arm64-latest # arm64/arm64v8 build
innovate/restic-mysql:amdhf-latest # armhf build
```

## Usage
The configuration is given via envvars, the following ones need to be set
* MYSQL_USER: username for MySQL
* MYSQL_PASSWORD: password for the user
* MYSQL_HOST: hostname of the MySQL server
* RESTIC_PASSWORD: password to encrypt the backup with
* RESTIC_REPOSITORY: repository for Restic to back up to
