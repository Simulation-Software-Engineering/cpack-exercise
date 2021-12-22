FROM ubuntu:20.04

# for development run docker container with:
# docker run -it --name cpack-exercise --mount type=bind,source="$(pwd)",target=/mnt/share ubuntu
# RUN cd /mnt/share

# statically link directory
ADD . /cmake-exercise
WORKDIR cmake-exercise

# init locale
RUN chmod +x inittimezone
COPY inittimezone /usr/local/bin/inittimezone
RUN /usr/local/bin/inittimezone

# install helpful packages
RUN apt-get update && apt-get install -y \
	build-essential \
	protobuf-compiler \
	g++ \
	cmake \
	git \
	wget \
	vim
	
# install dependencies
RUN apt-get update && apt-get install -y \
	libboost-all-dev \
	libdeal.ii-dev \
	libyaml-cpp-dev
	
CMD ["/bin/bash"]

## run main
RUN chmod +x packaging.sh && ./packaging.sh
