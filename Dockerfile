
FROM ubuntu:20.04

RUN apt-get update -y  

RUN apt-get install -y git
RUN git clone https://github.com/EvanA93/cpack-exercise.git

WORKDIR /cpack-exercise

COPY inittimezone /usr/local/bin/inittimezone
RUN /usr/local/bin/inittimezone

RUN apt-get install -y build-essential && apt-get install -y cmake && apt-get install -y libboost-all-dev\
&& apt-get install -y libdeal.ii-dev && apt-get install -y libopenmpi-dev && apt-get install -y libyaml-cpp-dev

RUN mkdir CPackExercise_build && cd CPackExercise_build && cmake  .. && \
make package && apt-get install ./cpackexample-0.2.0_amd64.deb && cpackexample ./yamlParser/config.yml