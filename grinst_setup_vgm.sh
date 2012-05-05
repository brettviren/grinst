#!/bin/bash

grinst_setup_vgm () {
    local prefix=$1; shift

    grinst_setup root
    eval $(grinst_setup root)

    grinst_setup geant4
    eval $(grinst_setup geant4)

    VGM_INSTALL=$prefix
    VGM_SYSTEM=Linux-g++
    LD_LIBRARY_PATH=$(pathadd ${VGM_INSTALL}/lib/${VGM_SYSTEM} $LD_LIBRARY_PATH)

    cat <<EOF
export VGM_INSTALL=$VGM_INSTALL
export VGM_SYSTEM=$VGM_SYSTEM
export USE_VGM=1
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH
EOF

}
