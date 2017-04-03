#!/bin/bash

grinst_install_root () {
    local version=$1; shift
    local prefix=$1 ; shift

    setup $(grinst_setup cmake)
    setup $(grinst_setup gccxml)
    setup $(grinst_setup python)
    setup $(grinst_setup pythia6)

    #local unpacked="root_v${version}.source"
    local unpacked="root-${version}"
    #https://root.cern.ch/download/root_v6.09.02.source.tar.gz
    local tarball="root_v${version}.source.tar.gz"
    local url="https://root.cern.ch/download/${tarball}"

    download "$url"
    if [ ! -d root ] ; then
	untar "$tarball" "$unpacked"
    fi
    if [ -d root ] ; then
	mv root $unpacked
    fi

    # pushd $unpacked
    # patch -p1 < $grinst_dir/root-v5.32.02-cmake.patch
    # popd
    local srcdir=$(readlink -f $unpacked)
    #apply_patches

    local blddir="$root_v${version}-cmake-build"
    assuredir $blddir
    pushd $blddir

    cmake $srcdir \
	-Dxrootd=OFF \
	-Dgdml=ON $root_cmake_flags \
        -DCMAKE_INSTALL_PREFIX=$prefix 

    make  $grinst_parallel
    make install
}
