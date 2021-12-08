FROM ubuntu:20.04

WORKDIR /var/src/ex

# Set timezone to Berlin
COPY helper_scripts/inittimezone /usr/local/bin/inittimezone
RUN /usr/local/bin/inittimezone

# Install necessary libraries and packages
RUN apt-get update \
    && apt-get install -y \
    build-essential \
    cmake \
    libboost-container-dev \
    libboost-filesystem-dev \
    libopenmpi-dev \
    libdeal.ii-dev \
    libyaml-cpp-dev \
    wget

# Install build helper script
COPY helper_scripts/build_project /usr/local/bin/build_project

# Default to building the project on run
CMD ["build_project"]
