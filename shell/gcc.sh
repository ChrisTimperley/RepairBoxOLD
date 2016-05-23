#!/bin/bash
#
# Installs GCC 4.6.3
#
test -d /usr/local/gcc/4.6.3 && exit 0;;
curl http://ftp.gnu.org/gnu/gcc/gcc-4.6.3/gcc-4.6.3.tar.gz | tar -xvf
pushd gcc-4.6.3
./contrib/download_prerequisites -f -y &&
./configure --prefix=/usr/local/gcc/4.6.3 &&
make &&
sudo make install &&
popd &&
rm gcc-4.6.3 -rf
