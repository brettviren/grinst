#!/bin/bash

grinst_install_geant4 () {
    local version=$1; shift
    local prefix=$1 ; shift

    source $(grinst_setup cmake)
    source $(grinst_setup xercesc)

    local unpacked="geant${version}"
    local tarball="${unpacked}.tar.gz"
    local url="http://geant4.cern.ch/support/source/$tarball"

    local srcdir=$(readlink -f $unpacked)

    download "$url"
    untar "$tarball" "$unpacked"
    assuredir "${unpacked}-cmake-build"
    pushd "${unpacked}-cmake-build"


    cmake \
	-DGEANT4_INSTALL_DATA=1 \
	-DCMAKE_INSTALL_PREFIX=$prefix \
	-DCMAKE_BUILD_TYPE=Debug \
	-DGEANT4_USE_GDML=ON \
	-DXERCESC_ROOT_DIR=$XERCESC_ROOT_DIR \
	-DGEANT4_USE_OPENGL_X11=ON \
	-DGEANT4_USE_G3TOG4=1 \
	$srcdir

    make $grinst_parallel
    make install

    pushd $prefix
    ln -s ....

    popd
    popd
}
