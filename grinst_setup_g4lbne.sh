#!/bin/bash

grinst_setup_g4lbne () {
    local prefix=$1; shift
    cat <<EOF
source $(grinst_setup python)
source $(grinst_setup ipython)
source $(grinst_setup root)
source $(grinst_setup geant4)
export PATH=\$(pathadd $prefix/bin \$PATH)
export LD_LIBRARY_PATH=\$(pathadd $prefix/bin \$LD_LIBRARY_PATH)
EOF
}
