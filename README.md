Alpine based Docker image with devpi client
===============================
author: Tobias Schoch

Overview
--------

A small footprint Docker image with devpi client installed intended to upload Python packages to a Python package index server.

Change-Log
----------

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
docker build . -t docker-alpine-devpi-client
```

Example
-------

run a container of the image

```bash
docker run docker-alpine-devpi-client devpi use ...
```