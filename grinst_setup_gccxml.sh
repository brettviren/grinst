#!/bin/bash

grinst_setup_gccxml () {
    local prefix=$1; shift

    PATH=$(pathadd $prefix/bin $PATH)

    cat <<EOF
export PATH=$PATH
EOF
    
}