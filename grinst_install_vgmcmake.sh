#!/bin/bash

grinst_install_vgmcmake () {
    local version=$1; shift
    local prefix=$1 ; shift

    eval $(grinst_setup geant4)
    eval $(grinst_setup root)

    local url
    if [ "$version" = "trunk" ] ; then
	url="https://vgm.svn.sourceforge.net/svnroot/vgm/trunk/vgm"
    else
	url="https://vgm.svn.sourceforge.net/svnroot/vgm/tags/v${version}/vgm"
    fi
    unpacked="vgm.${version}"
    svnco $url $unpacked
    
    local srcdir=$(readlink -f $unpacked)

    local blddir="vgm-${version}-cmake-build"
    assuredir $blddir
    pushd $blddir

    cmake \
	-DCMAKE_INSTALL_PREFIX=$prefix \
	-DWITH_TEST=OFF \
	-DGEANT4_INCLUDE_DIR=$geant4_install_dir/include/Geant4 \
	$srcdir
        
    make $grinst_parallel
    make install

}
