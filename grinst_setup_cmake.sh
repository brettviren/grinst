#!/bin/bash

grinst_setup_cmake () {
    local prefix=$1; shift

    export PATH=$(pathadd $prefix/bin $PATH)
    cat <<EOF
export PATH=$PATH
EOF
    
}
