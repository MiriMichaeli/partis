FROM matsengrp/cpp

# Java bit copied from https://github.com/jplock/docker-oracle-java7
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update && apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y \
    oracle-java7-installer \
    libncurses5-dev \
    libroot-bindings-python-dev \
    libroot-graf2d-postscript5.34 \
    libxml2-dev \
    libxslt1-dev \
    python-scipy \
    zlib1g-dev
RUN pip install \
    beautifulsoup4 \
    biopython \
    cython \
    decorator \
    dendropy \
    lxml \
    networkx \
    pysam \
    pyyaml


COPY . /partis
WORKDIR /partis
CMD ./build-and-test.sh
