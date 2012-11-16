#!/bin/bash

grinst_setup_xercesc () {
    local prefix=$1; shift

    PATH=$(pathadd $prefix/bin $PATH)
    LD_LIBRARY_PATH=$(pathadd $prefix/lib $LD_LIBRARY_PATH)
    XERCESC_ROOT_DIR=$prefix
    cat <<EOF
export PATH=$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH
export XERCESC_ROOT_DIR=$XERCESC_ROOT_DIR

EOF
}
