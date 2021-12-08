FROM ubuntu:20.04

# Set timezone
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install packages
RUN apt update -y
RUN apt install -y libboost-all-dev cmake build-essential libdeal.ii-dev git vim libyaml-cpp-dev

# Copy folder to the container
ADD . /cpack-exercise

# set path variable correctly
RUN PATH="/usr/local/bin":"${PATH}"

# Create build folder and run
RUN cd cpack-exercise && mkdir build
WORKDIR /cpack-exercise/build 
# Run cmake
RUN cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release ..
# Run cpack to create packages
RUN cpack -G DEB && cpack -G TGZ
# Install the Debian package
RUN apt install ./cpackexample_0.2.0_amd64.deb
# Make shell script executable
RUN chmod +x ../run_in_container.sh

ENTRYPOINT ../run_in_container.sh ; /bin/bash
