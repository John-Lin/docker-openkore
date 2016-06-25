# OpenKore in Docker
FROM ubuntu:14.04.4

MAINTAINER John Lin <linton.tw@gmail.com>

ENV HOME /root
# Define working directory.
WORKDIR /root

RUN apt-get update && \
    apt-get install -y \
        python-setuptools \
        python-pip \
        curl \
        build-essential \
        g++ \
        perl \
        libreadline6-dev \
        libcurl4-gnutls-dev \
        zlib1g-dev \
        vim

RUN curl -kL https://github.com/OpenKore/openkore/archive/twRO_New.tar.gz | tar -xvz \
    && mv openkore-twRO_New openkore \
    && cd openkore \
    && perl ./openkore.pl -v \
    && exit 0


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
