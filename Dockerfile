# How to set up:
# vim Dockerfile
# docker build -t <image_name> .
# docker run -it --name <container_name> <image_name>

FROM ubuntu:20.04
SHELL ["/bin/bash", "-c"]

# Clone Respository from github
RUN apt update -y && apt install -y git
RUN git clone https://github.com/constracktor/cpack-exercise.git

# Define work directory
WORKDIR /cpack-exercise

# Prevent image from asking time-zone
RUN chmod +x inittimezone
RUN cp inittimezone /usr/local/bin/inittimezone
RUN /usr/local/bin/inittimezone

# Install required software
RUN apt install -y cmake build-essential libdeal.ii-dev libyaml-cpp-dev
RUN apt-get update -y && apt-get install -y libboost-all-dev

# Make build directory, call cmake and execute the programm (just as verification)
RUN mkdir build && cd build && cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release .. && make -j && ./cpackexample

# Create tar-Package and decompress it
RUN cd build && cpack -G TGZ && tar -xzf cpackexample-0.2.0-Linux.tar.gz

# Create debian-Package and run package
RUN cd build && cpack -G DEB && apt-get install ./cpackexample-0.2.0-Linux.deb && cd .. && cpackexample ./yamlParser/config.yml
