FROM ubuntu:20.04

WORKDIR /cmake_exercise

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get -y install build-essential cmake git-all wget

RUN apt-get install -y libboost-all-dev libdeal.ii-dev libyaml-cpp-dev

COPY . .

RUN mkdir build && cd build && cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release .. && make install

CMD ["/bin/bash"]