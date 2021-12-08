From ubuntu:20.04

COPY inittimezone /usr/local/bin/inittimezone

# Run inittimezone and install a few dependencies
RUN apt-get -qq update && \
    inittimezone && \
    apt-get -qq -y install \
        build-essential \
        cmake \
        g++ \
        git \
        libboost-all-dev \
        wget \
        libdeal.ii-dev \
        vim \
        libyaml-cpp-dev

ADD . /cpack-exercise
WORKDIR /cpack-exercise

# Create build directory and start make executable
RUN mkdir build \
&& cd build \
&& cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release .. \
&& make package

# Execute the program
RUN cd build \
&& ./cpackexample

# Install the package
RUN cd build && dpkg -i cpackexample_0.2.0_amd64.deb \
&& apt-get install ./cpackexample_0.2.0_amd64.deb

# Execute the program
RUN cd build && cpackexample ../yamlParser/config.yml

CMD ["/bin/bash"]
