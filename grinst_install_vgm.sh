#!/bin/bash

grinst_install_vgm () {
    local version=$1; shift
    local prefix=$1 ; shift

    source $(grinst_setup geant4)
    source $(grinst_setup root)

    local url
    if [ "$version" = "trunk" ] ; then
	url="https://vgm.svn.sourceforge.net/svnroot/vgm/tags/trunk/vgm"
    else
	url="https://vgm.svn.sourceforge.net/svnroot/vgm/tags/v${version}/vgm"
    fi
    unpacked="vgm.${version}"
    svnco $url $unpacked
    pushd $unpacked
    
    export VGM_INSTALL="$(pwd)"
    export VGM_SYSTEM="Linux-g++"

    pushd packages
    make
    popd
    
    assuredir $prefix
    tar -cf - lib $(find packages -name '*.h' -print) | (cd $prefix; tar -xf -)
}

