# how run the container:
# docker build -t <image_name> . 
# docker run -it --name <container_name> <image_name>

FROM ubuntu:20.04

COPY inittimezone /usr/local/bin/inittimezone
RUN chmod +x /usr/local/bin/inittimezone

# Install a remaining dependencies
RUN apt-get -qq update && \
        inittimezone && \
        apt-get -qq -y install \
        build-essential \
        cmake \
        g++ \
        wget \
        nano \
        libboost-all-dev \
        libdeal.ii-dev \
        libyaml-cpp-dev
        

# This is some strange Docker problem. Normally, you don't need to add /usr/local/lib to LIBRARY_PATH
ENV LIBRARY_PATH $LIBRARY_PATH:/usr/local/lib/

# Copy complete folder
ADD . /cpack-exercise

# Change working directory
WORKDIR /cpack-exercise

# Create package
RUN mkdir build && \
        cd build && \
        cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release .. && \
        cpack -G TGZ && \
        cpack -G DEB

# Install and run debian package
RUN cd build && \
        apt-get install ./cpackexample-0.2.0-Linux.deb
RUN cpackexample ./yamlParser/config.yml
CMD ["/bin/bash"]
