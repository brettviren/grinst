#!/bin/bash

grinst_setup_hepmc () {
    local prefix=$1; shift

    PATH=$(pathadd $prefix/bin $PATH)
    LD_LIBRARY_PATH=$(pathadd $prefix/lib $LD_LIBRARY_PATH)    

    cat <<EOF
export PATH=$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH

EOF
}