docker-opendocman-fullstack
===========================

Full-stack OpenDocMan docker cluster using Fig
#Docker OpenDocMan Full Stack with MySQL
If you are looking for a pre-build docker image look here:

[Docker Hub Site for OpenDocMan](https://registry.hub.docker.com/u/stephenlawrence/opendocman-www/)

This repo contains the files needed to build a docker cluster running
the latest version of OpenDocMan along with Apache 2, PHP, MySQL, and File Storage.

###To Buid:

(Requires a docker client (or boot2docker for Mac), Fig and a docker host)

"fig up -d"

You should then have a running instance and if you visit your container IP address you 
will be shown an admin login (admin/no password). Change the admin password once you login.
