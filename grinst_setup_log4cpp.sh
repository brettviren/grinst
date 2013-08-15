#!/bin/bash

grinst_setup_log4cpp () {
    local prefix=$1; shift
    cat <<EOF    
export PATH=\$(pathadd $prefix/bin \$PATH)
export LD_LIBRARY_PATH=\$(pathadd $prefix/lib \$LD_LIBRARY_PATH)
EOF
}
