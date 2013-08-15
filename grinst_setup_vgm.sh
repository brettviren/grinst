#!/bin/bash

grinst_setup_vgm () {
    local prefix=$1; shift
    cat <<EOF
source $(grinst_setup root)
source $(grinst_setup geant4)
export VGM_INSTALL=$prefix
export VGM_SYSTEM=Linux-g++
export LD_LIBRARY_PATH=\$(pathadd \${VGM_INSTALL}/lib/\${VGM_SYSTEM} \$LD_LIBRARY_PATH)
export USE_VGM=1
EOF
}
