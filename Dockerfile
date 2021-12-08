FROM ubuntu:20.04

# working directory
ADD . /cpack_exercise
WORKDIR /cpack_exercise

# timezone stuff
RUN chmod +x inittimezone
COPY inittimezone /usr/local/bin/inittimezone
RUN /usr/local/bin/inittimezone

# install packages& dependencies
RUN apt-get -y update 
RUN apt install -y build-essential cmake git vim libboost-all-dev libdeal.ii-dev libyaml-cpp-dev

# add bin to path variable
RUN PATH="${PATH}":"/usr/local/bin"

# create package
# create build directory and make executable
RUN rm -rf build && mkdir build 
RUN cd build && cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release .. && make package

#CMD ["/bin/bash"]
