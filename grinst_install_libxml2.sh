#!/bin/bash

grinst_install_libxml2 () {
    local version=$1; shift
    local prefix=$1 ; shift

    source $(grinst_setup python)

    local unpacked="libxml2-${version}"
    local tarball="${unpacked}.tar.gz"
    local url="ftp://xmlsoft.org/libxml2/${tarball}"

    download "$url"
    untar "$tarball" "$unpacked"

    pushd "$unpacked"

    ./configure --prefix="$prefix"
    make 
    make install

    popd
}
