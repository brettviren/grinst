#!/bin/bash

grinst_setup_orkailcroot () {
    local prefix=$1; shift
    local tgt=$(root-config --arch)
    cat <<EOF
source $(grinst_setup python)
source $(grinst_setup geant4)
source $(grinst_setup root)
source $(grinst_setup geant3vmc)
export ILC_ROOT=$prefix
export PATH=\$(pathadd $prefix/bin/tgt_$tgt \$PATH)
export LD_LIBRARY_PATH=\$(pathadd $prefix/lib/tgt_$tgt \$LD_LIBRARY_PATH)
EOF
}


