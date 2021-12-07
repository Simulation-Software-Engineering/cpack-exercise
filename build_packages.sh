#!/bin/bash
# Compile commands for exercise

git clone https://github.com/qwach/cpack-exercise.git
mkdir -p cpack-exercise/build && cd cpack-exercise/build
cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release ..
make -j
cpack -G DEB\;TGZ

cp cpackexample-*.*.*-Linux.tar.gz /mnt/package-build-dir/
cp cpackexample_*.*.*_*.deb /mnt/package-build-dir/
