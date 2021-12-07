# Packaging with CPack

Repository for the [CPack exercise](https://github.com/Simulation-Software-Engineering/Lecture-Material/blob/main/building-and-packaging/material/packaging_cpack_debian_exercise.md). The code is a slightly modified version of the [code used in the CMake exercise](https://github.com/Simulation-Software-Engineering/cmake-exercise).

The Docker container will build the packages and copy them to your working directory if you run

```docker run --rm -it --mount type=bind,source="$(pwd)",target=/mnt/package-build-dir qwach/sse-cpack-exercise build_packages.sh```
