#!/bin/bash

grinst_setup_libxml2 () {
    local prefix=$1 ; shift
    cat<<EOF
source $(grinst_setup python)
export PATH=\$(pathadd $prefix/bin \$PATH)
export LD_LIBRARY_PATH=\$(pathadd $prefix/lib \$LD_LIBRARY_PATH)
EOF
}
