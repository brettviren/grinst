#!/bin/bash

# http://lcgapp.cern.ch/project/simu/HepMC/

grinst_install_hepmc () {
    local version=$1; shift
    local prefix=$1 ; shift

    eval $(grinst_setup cmake)

    local unpacked="HepMC-$version"
    local tarball="$unpacked.tar.gz"
    local url="http://lcgapp.cern.ch/project/simu/HepMC/download/$tarball"

    download "$url"
    untar "$tarball" "$unpacked"

    local srcdir=$(readlink -f $unpacked)

    local blddir="$unpacked-cmake-build"
    assuredir $blddir
    pushd $blddir

    echo 'Configuring with CLHEP/Geant4 units'
    cmake $srcdir \
          -DCMAKE_INSTALL_PREFIX=$prefix  \
          -Dmomentum:STRING=MEV \
          -Dlength:STRING=MM 

    make $grinst_parallel
    make install
}
    