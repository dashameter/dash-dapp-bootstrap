FROM ubuntu:bionic

ENV INSTALL_DIRECTORY=dash-dapp-bootstrap

RUN apt update \
    && apt install -y git sudo

RUN mkdir -p /$INSTALL_DIRECTORY
COPY . /$INSTALL_DIRECTORY
WORKDIR /$INSTALL_DIRECTORY

ENTRYPOINT ["tail", "-f", "/dev/null"]
