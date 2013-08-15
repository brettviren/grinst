#!/bin/bash

grinst_setup_root () {
    local prefix=$1; shift

    cat <<EOF
source $(grinst_setup gccxml)
source $(grinst_setup python)
export ROOTSYS=$prefix
export PATH=\$(pathadd $prefix/bin \$PATH)
export LD_LIBRARY_PATH=\$(pathadd $prefix/lib \$LD_LIBRARY_PATH)    
export PYTHONPATH=\$(pathadd $prefix/lib \$PYTHONPATH)
EOF
}
