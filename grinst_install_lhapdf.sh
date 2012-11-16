#!/bin/bash

grinst_install_lhapdf () {
    local version=$1; shift
    local prefix=$1 ; shift

    local unpacked="lhapdf-${version}"
    local tarball="${unpacked}.tar.gz"
    local url="http://www.hepforge.org/archive/lhapdf/$tarball"

    download "$url" 
    untar "$tarball" "$unpacked"

    pushd "$unpacked"

    ./configure --prefix="$prefix"
    make 
    make install

    popd

}
