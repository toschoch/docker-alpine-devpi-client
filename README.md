Alpine based Docker image with devpi client
===============================
author: Tobias Schoch

Overview
--------

A small footprint Docker image with devpi client installed intended to upload Python packages to a Python package index server.

Change-Log
----------
##### 1.0.3
* new isTag() function

##### 1.0.2
* regex in jenkinsfile

##### 1.0.1
* fixed catch in jenkinsfile

##### 1.0.0
* added a good error message for shallow clones
* test for tag through string in jenkinsfile
* added tags in Jenkinsfile
* make really general purpose devpi-client
* made image more general purpose with entrypoint and cmd
* removed redundant docker from image name
* update readme
* initial docker image with python3 and devpi-client


##### 0.0.1
* initial version

Installation / Usage
--------------------
clone the repo:

```bash
git clone git@github.com:toschoch/docker-alpine-devpi-client.git
```

build the docker image

```bash
docker build . -t alpine-devpi-client
```

Drone
-----

build and deploy with drone-cli

set `DRONE_SERVER` and `DRONE_TOKEN` according to your drone server

```bash
drone exec --secret-file .secrets
```

Example
-------

run a container of the image

```bash
docker run -it --rm alpine-devpi-client devpi use ...
```