# OpenKore in Docker
FROM ubuntu:14.04.4

MAINTAINER John Lin <linton.tw@gmail.com>

RUN apt-get update && \
    apt-get install -y \
        python-setuptools \
        python-pip \
        python-dev \
        wget \
        build-essential \
        g++ \
        perl \
        libreadline6-dev \
        libcurl4-gnutls-dev \
        zlib1g-dev \
        unzip \
        vim

RUN wget --no-check-certificate \
        https://github.com/OpenKore/openkore/archive/twRO_New.zip \
    && unzip twRO_New.zip

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Define working directory.
WORKDIR /root
