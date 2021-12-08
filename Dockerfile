FROM ubuntu:20.04

WORKDIR /cpack_exercise



ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get -y install build-essential cmake git-all wget

RUN apt-get -y install libboost-all-dev libdeal.ii-dev libyaml-cpp-dev

COPY . .
# For some reason this is necessary in order to run make install
# RUN LD_LIBRARY_PATH=/usr/local/lib && export LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/lib/

RUN mkdir build && cd build && cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release .. && cpack -G TGZ && cpack -G DEB

CMD ["/bin/bash"]