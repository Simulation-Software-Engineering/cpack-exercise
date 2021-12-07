FROM ubuntu:20.04

# Set timezone
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install packages
RUN apt update -y
RUN apt install -y libboost-all-dev cmake build-essential libdeal.ii-dev git vim libyaml-cpp-dev

# Copy folder to the container
ADD . /cpack-exercise

# Create build folder and run cmake
RUN cd cpack-exercise && mkdir build && cd build && cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release ..
# Run cpack to create packages
#RUN cpack -G DEB && cpack -G TGZ
# Install the Debian package
#RUN apt install ./cpackexample_0.2.0_amd64.deb
# Copy the packages to the mounted directory
#RUN cp cpackexample_0.2.0_amd64.deb ../../mnt/package-build-dir/ && cp cpackexample-0.2.0-Linux.tar.gz ../../mnt/package-build-dir/

CMD ["/bin/bash"]
