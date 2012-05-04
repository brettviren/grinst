#!/bin/bash

grinst_setup_root () {
    local prefix=$1; shift

    eval $(grinst_setup gccxml)
    eval $(grinst_setup python)

    grinst_setup gccxml
    grinst_setup python

    ROOTSYS=$prefix
    PATH=$(pathadd $prefix/bin $PATH)
    LD_LIBRARY_PATH=$(pathadd $prefix/lib $LD_LIBRARY_PATH)    
    PYTHONPATH=$(pathadd $prefix/lib $PYTHONPATH)

    cat <<EOF
export ROOTSYS=$ROOTSYS
export PATH=$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH
export PYTHONPATH=$PYTHONPATH

EOF
}
