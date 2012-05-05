#!/bin/bash

grinst_install_vgm () {
    local version=$1; shift
    local prefix=$1 ; shift

    eval $(grinst_setup geant4)
    eval $(grinst_setup root)

    url="https://vgm.svn.sourceforge.net/svnroot/vgm/tags/v${version}/vgm"
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

