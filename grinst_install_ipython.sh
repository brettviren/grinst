#!/bin/bash

grinst_install_ipython () {
    local version=$1; shift
    local prefix=$1 ; shift

    eval $(grinst_setup python)

    local unpacked="ipython-${version}"
    local tarball="${unpacked}.tar.gz"
    local url="http://archive.ipython.org/release/${version}/$tarball"

    download "$url"
    untar "$tarball" "$unpacked"
    pushd "$unpacked"

    python setup.py install --prefix=$prefix

    popd
    
}