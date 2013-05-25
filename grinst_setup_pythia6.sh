#!/bin/bash

# this setup is basically just for ROOT
grinst_setup_pythia6 () {
    local prefix=$1; shift
    cat <<EOF
export PYTHIA6_DIR=${prefix}
export LD_LIBRARY_PATH=\$(pathadd $prefix/lib \$LD_LIBRARY_PATH)
EOF
}
