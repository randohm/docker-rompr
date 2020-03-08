# docker-rompr
RompR Docker image.


Built on Alpine and running Apache+PHP7.
This only includes RompR.
There is no built in database other than using the built-in SQLite, but connecting to a Mysql DB can be configured at startup.
For now, all the Apache defaults are used.

## Prerequisistes

1. Get the RompR ZIP file from https://github.com/fatg3erman/RompR/releases
1. Unzip the file.
1. Tar the `rompr/` directory up: `tar xcvf rompr.tgz rompr`

This creates a tarball that `docker build` can work with.

## Build

Run the normal:  
`docker built .`
