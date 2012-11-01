#!/bin/bash

grinst_setup_cernlib () {
    local prefix=$1; shift
    export CERN_LEVEL=$(basename $prefix)
    export CERN=$(dirname $prefix)
    export CERN_ROOT=$prefix
    PATH=$(pathadd $prefix/bin $PATH)
    LD_LIBRARY_PATH=$(pathadd $prefix/lib $LD_LIBRARY_PATH)

cat <<EOF
export CERN_LEVEL=$CERN_LEVEL
export CERN=$CERN
export CERN_ROOT=$CERN_ROOT
PATH=$PATH
LD_LIBRARY_PATH=$LD_LIBRARY_PATH
EOF

}
