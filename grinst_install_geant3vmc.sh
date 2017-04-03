#!/bin/bash

# Install the Geant3+VMC code

grinst_install_geant3vmc () {
    local version=$1; shift
    local prefix=$1 ; shift

    source $(grinst_setup root)

    local unpacked="geant321+_vmc.${version}"
    local tarball="${unpacked}.tar.gz"
    local url="ftp://root.cern.ch/root/vmc/$tarball"

    download "$url"
    if [ ! -d geant3 ] ; then
	untar "$tarball" "$unpacked"
    fi
    if [ -d geant3 ] ; then
	mv geant3 "$unpacked"
    fi

    local srcdir=$(readlink -f $unpacked)

    pushd $srcdir
    
    make 

    assuredir $prefix
    cp -a lib/ $prefix/
    assuredir $prefix/TGeant3
    cp -a TGeant3/*.h $prefix/TGeant3/
    
    popd
}
