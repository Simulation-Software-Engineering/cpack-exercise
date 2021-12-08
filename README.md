# Packaging with CPack

```sh
# Build docker image
docker build -t local .

# Build binaries
docker run --rm -it -v $PWD:/var/src/ex local

# Run bash inside docker
docker run --rm -it -v $PWD:/var/src/ex local bash
cd build/  # enter build dir
make package  # build the package
apt install ./cpackexample_0.2.0_amd64.deb  # install the resulting deb file
cpackexample  # run the installed binary
