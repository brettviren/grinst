#!/bin/bash

grinst_setup_orkailcroot () {
    local prefix=$1; shift

    eval $(grinst_setup python)
    grinst_setup python

    eval $(grinst_setup geant4)
    grinst_setup geant4

    eval $(grinst_setup root)
    grinst_setup root

    eval $(grinst_setup geant3vmc)
    grinst_setup geant3vmc

    local tgt=$(root-config --arch)

    ILC_ROOT=$prefix
    PATH=$(pathadd $prefix/bin/tgt_$tgt $PATH)
    LD_LIBRARY_PATH=$(pathadd $prefix/lib/tgt_$tgt $LD_LIBRARY_PATH)    
cat <<EOF
export ILC_ROOT=$ILC_ROOT
export PATH=$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH

EOF

}


