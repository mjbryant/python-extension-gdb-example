FROM ubuntu:18.04
MAINTAINER mbryantj@gmail.com

RUN apt-get update && apt-get install -y \
    python3-dev \
    python3-dbg \
    python3-pip \
    gdb \
    make \
    gcc

RUN pip3 install ipython

WORKDIR /root/home
