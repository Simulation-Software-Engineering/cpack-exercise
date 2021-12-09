#!/bin/bash
FROM ubuntu:20.04

# Copy files to Docker container
COPY . /cpack-exercise/

CMD ["/bin/bash"]

# Set timezone
COPY inittimezone /usr/local/bin/inittimezone
RUN /usr/local/bin/inittimezone

# Install software packages
RUN apt update && apt install -y g++ build-essential cmake git wget vim libboost-all-dev  libdeal.ii-dev libyaml-cpp-dev


# RUN git clone https://github.com/jbeder/yaml-cpp && cd yaml-cpp && mkdir build && cd build && cmake -YAML_BUILD_SHARED_LIBRARY=ON .. && make install

# delete source files if necessary
# RUN rm -rf yaml-cpp

# Set working directory
WORKDIR /cpack-exercise

# Build the executable
# RUN mkdir build && cd build && cmake .. && make package

