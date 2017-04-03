#!/bin/bash

grinst_install_cmake () {
    local version=$1; shift
    local prefix=$1 ; shift

    local unpacked="cmake-${version}"
    local tarball="${unpacked}.tar.gz"
#    local url="http://www.cmake.org/files/v2.8/$tarball"
#    local url="https://cmake.org/files/v2.8/$tarball"
    local url="https://cmake.org/files/v3.7/$tarball"
              

    download "$url"
    untar "$tarball" "$unpacked"
    pushd "$unpacked"

    ./bootstrap --prefix="$prefix"
    make 
    make install
    popd
}