#!/bin/bash

grinst_setup_geant3vmc () {
    local prefix=$1; shift
    cat <<EOF
source $(grinst_setup root)
export GEANT3DIR=$prefix
export LD_LIBRARY_PATH=\$(pathadd $prefix/lib \$LD_LIBRARY_PATH)
EOF
}
