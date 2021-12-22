FROM ubuntu:20.04

SHELL ["/bin/bash", "-c"]

# set working directory
ADD . /cpack-exercise
WORKDIR /cpack-exercise

# include time zone info
RUN chmod +x inittimezone
COPY inittimezone /usr/local/bin/inittimezone
RUN /usr/local/bin/inittimezone

# install packages
RUN apt -y update
RUN apt install -y build-essential cmake git vim libboost-all-dev libdeal.ii-dev libopenmpi-dev libyaml-cpp-dev

# set path variable correctly
RUN PATH="/usr/local/bin":"${PATH}"

# create build directory and make executable
RUN mkdir build \
&& cd build \
&& cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release .. \
&& make package

# check generated packages
RUN cd build \
&& dpkg -i cpackexample_0.2.0_amd64.deb \
&& ./cpackexample

