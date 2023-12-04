FROM ubuntu:22.04 AS builder

RUN apt-get update \
	&& apt-get -y install make gcc \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


WORKDIR /usr/src/fftw
ADD ./fftw-*.tar.gz /tmp
RUN mv /tmp/fftw-*/* /usr/src/fftw


RUN ./configure \
    && make \
    && make install