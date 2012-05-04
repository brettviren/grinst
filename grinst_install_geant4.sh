#!/bin/bash

grinst_install_geant4 () {
    local version=$1; shift
    local prefix=$1 ; shift

    eval $(grinst_setup cmake)

    local unpacked="geant${version}"
    local tarball="${unpacked}.tar.gz"
    local url="http://geant4.cern.ch/support/source/$tarball"

    local srcdir=$(readlink -f $unpacked)

    download "$url"
    untar "$tarball" "$unpacked"
    assuredir "${unpacked}-cmake-build"
    pushd "${unpacked}-cmake-build"


    cmake -DGEANT4_INSTALL_DATA=1 \
	  -DCMAKE_INSTALL_PREFIX=$prefix \
	  -DGEANT4_USE_OPENGL_X11=ON \
	  -DGEANT4_USE_G3TOG4=1 \
	  $srcdir

    make -j8
    make install

    pushd $prefix
    ln -s ....

    popd
    popd
}