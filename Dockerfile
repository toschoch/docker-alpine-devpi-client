FROM python:3-alpine

RUN pip install devpi-client

USER root

ENTRYPOINT [ "ash"]
