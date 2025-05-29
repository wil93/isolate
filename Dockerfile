FROM ubuntu:22.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    asciidoc \
    build-essential \
    docbook-xml \
    docbook-xsl \
    libcap-dev \
    libsystemd-dev \
    libxml2-utils \
    pkg-config \
    xsltproc

COPY . /root
WORKDIR /root

RUN make
RUN make install
