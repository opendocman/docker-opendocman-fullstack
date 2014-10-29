#Docker OpenDocMan Minimal without MySQL

This repo contains the files needed to build a docker image running
the latest version of OpenDocMan along with Apache 2 and PHP.
Requires a functional MySQL database/username/password.

###To Buid:

(Requires a docker client (or boot2docker for Mac) and a  docker server)

`docker build --tag="opendocman-minimal" .`

###To Run:

`docker run -d -p 8080:80 -v ~/odm_data:/var/www/odm_data opendocman`

You should then have a running instance and if you visit your container URL you 
will be prompted to run through the OpenDocMan installer.
