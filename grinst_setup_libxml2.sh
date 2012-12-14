#!/bin/bash

grinst_setup_libxml2 () {
    local prefix=$1 ; shift

    eval $(grinst_setup python)
    grinst_setup python

    PATH=$(pathadd $prefix/bin $PATH)
    LD_LIBRARY_PATH=$(pathadd $prefix/lib $LD_LIBRARY_PATH)    

cat<<EOF
export PATH=$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH
EOF
}
