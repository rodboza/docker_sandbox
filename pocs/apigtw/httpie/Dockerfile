FROM ubuntu:latest

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y python3 httpie
ENTRYPOINT tail -F anything
