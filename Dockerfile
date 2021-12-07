FROM ubuntu:20.04

# set up shell + timezone stuff
SHELL ["/bin/bash", "-c"]
COPY inittimezone /usr/local/bin/inittimezone
RUN chmod +x /usr/local/bin/inittimezone
RUN /usr/local/bin/inittimezone

# cmake + git + libraries

RUN apt-get -y update
RUN apt-get -y install build-essential cmake git nano libboost-all-dev libyaml-cpp-dev libdeal.ii-dev

COPY build_packages.sh /usr/local/bin/build_packages.sh
RUN chmod +x /usr/local/bin/build_packages.sh
