#!/bin/bash

grinst_setup_geant3vmc () {
    local prefix=$1; shift

    eval $(grinst_setup root)
    grinst_setup root
    
    GEANT3DIR=$prefix
    LD_LIBRARY_PATH=$(pathadd $prefix/lib $LD_LIBRARY_PATH)    

    cat <<EOF
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH
export GEANT3DIR=$GEANT3DIR
EOF
}
