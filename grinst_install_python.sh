#!/bin/bash

grinst_install_python () {
    local version=$1; shift
    local prefix=$1 ; shift

    local unpacked="Python-${version}"
    local tarball="${unpacked}.tgz"
    local url="http://python.org/ftp/python/${version}/${tarball}"

    download "$url"
    untar "$tarball" "$unpacked"
    pushd "$unpacked"

    ./configure --prefix="$prefix" --enable-shared 
    make 
    make install

    popd

}