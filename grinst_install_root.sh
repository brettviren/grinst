#!/bin/bash

grinst_install_root () {
    local version=$1; shift
    local prefix=$1 ; shift

    eval $(grinst_setup cmake)
    eval $(grinst_setup gccxml)
    eval $(grinst_setup python)

    local unpacked="root_v${version}.source"
    local tarball="${unpacked}.tar.gz"
    local url="ftp://root.cern.ch/root/$tarball"

    download "$url"
    untar "$tarball" "$unpacked"
    mv root $unpacked

    local srcdir=$(readlink -f $unpacked)

    local blddir="$root_v${version}-cmake-build"
    assuredir $blddir
    pushd $blddir

    cmake $srcdir -DCMAKE_INSTALL_PREFIX=$prefix
    make $grinst_parallel
    make install
}