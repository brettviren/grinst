#!/bin/bash

grinst_setup_cernlib () {
    local prefix=$1; shift
    cat <<EOF
export CERN_LEVEL=$(basename $prefix)
export CERN=$(dirname $prefix)
export CERN_ROOT=$prefix
export PATH=\$(pathadd $prefix/bin \$PATH)
export LD_LIBRARY_PATH=\$(pathadd $prefix/lib \$LD_LIBRARY_PATH)
EOF
}
