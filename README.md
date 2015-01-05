#Docker OpenDocMan Full Stack with MySQL

Full-stack OpenDocMan docker cluster using Fig.

If you are looking for a pre-build docker image look here:

[Docker Hub Site for OpenDocMan](https://registry.hub.docker.com/u/stephenlawrence/opendocman-www/)

This repo contains the files needed to build a docker three container cluster running
the latest version of OpenDocMan, Apache 2, PHP (container 1), MySQL (container 2), and File Storage (container 3).

###To Build Your Cluster:

(Requires a docker client (or boot2docker for Mac), [Fig](http://www.fig.sh) and a docker host)

"fig up -d"

You should then have a running instance and if you visit your container IP address you 
will be shown an admin login (admin/no password). Change the admin password once you login.

As long as you do not remove the file storage container your data will be stored indefinately, including 
your file data directory and your mysql database files.
