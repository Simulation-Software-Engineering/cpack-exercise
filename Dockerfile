FROM ubuntu:20.04

# Clone files from github
RUN apt update -y
RUN apt install -y git
RUN git clone https://github.com/mohamad-altaweel/cpack-exercise.git

# set work dir
WORKDIR /cpack-exercise

# run inittimezone
COPY inittimezone /usr/local/bin/inittimezone
RUN /usr/local/bin/inittimezone


# install packages
RUN apt-get -y install build-essential cmake vim libboost-all-dev libdeal.ii-dev libopenmpi-dev libyaml-cpp-dev


RUN mkdir build \
&& cd build \
&& cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release .. \
&& make -j \
&& cpack -G DEB \
&& cpack -G TGZ