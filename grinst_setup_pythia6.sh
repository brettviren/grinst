#!/bin/bash

# this setup is basically just for ROOT
grinst_setup_pythia6 () {
    local prefix=$1; shift

    export PYTHIA6_DIR=${prefix}
    LD_LIBRARY_PATH=$(pathadd $prefix/lib $LD_LIBRARY_PATH)    
    cat <<EOF
    export PYTHIA6_DIR=${prefix}
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH
EOF
}
