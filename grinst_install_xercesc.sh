#!/bin/bash

grinst_install_xercesc () {
    local version=$1; shift
    local prefix=$1 ; shift

    local unpacked="xerces-c-${version}"
    local tarball="${unpacked}.tar.gz"
    local url="http://mirror.metrocast.net/apache//xerces/c/3/sources/$tarball"

    local srcdir=$(readlink -f $unpacked)

    download "$url"
    untar "$tarball" "$unpacked"
    pushd "$unpacked"

    ./configure --prefix="$prefix"
    make 
    make install

    popd

}
