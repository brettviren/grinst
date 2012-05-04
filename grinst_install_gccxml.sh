#!/bin/bash

grinst_install_gccxml () {
    local version=$1; shift
    local prefix=$1 ; shift
    
    eval $(grinst_setup cmake)

    local unpacked="gccxml-$version"
    local tarball="${unpacked}.tar.gz"
    local url="http://service-spi.web.cern.ch/service-spi/external/tarFiles/$tarball"
    unpacked=$(echo $unpacked | tr '_' '-')

    download "$url"
    untar "$tarball" "$unpacked"

    srcdir=$(readlink -f $unpacked)
    blddir=${unpacked}-cmake-build
    assuredir $blddir
    pushd $blddir

    cmake $srcdir -DCMAKE_INSTALL_PREFIX:PATH=$prefix
    make $grinst_parallel
    make install
    
    popd
}