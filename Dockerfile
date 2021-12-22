FROM ubuntu:20.04

ADD . /inittimezone 

# script for timezone issue
RUN chmod +x inittimezone
COPY inittimezone /usr/local/bin/inittimezone
RUN /usr/local/bin/inittimezone

# install necessary packages
RUN apt-get update && apt-get install -y \
            build-essential \
            cmake \ 
            git \
            wget \
            vim \
            libboost-all-dev \
            libdeal.ii-dev

# for the yaml dependency
RUN apt-get install -y libyaml-cpp-dev