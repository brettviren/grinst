#!/bin/bash

grinst_setup_genie () {
    local prefix=$1; shift

    eval $(grinst_setup python)
    grinst_setup python
    eval $(grinst_setup pythia6)
    grinst_setup pythia6
    eval $(grinst_setup lhapdf)
    grinst_setup lhapdf
    eval $(grinst_setup log4cpp)
    grinst_setup log4cpp
    eval $(grinst_setup root)
    grinst_setup root

    PATH=$(pathadd $prefix/bin $PATH)
    LD_LIBRARY_PATH=$(pathadd $prefix/lib $LD_LIBRARY_PATH)    
    GENIE=$prefix

cat<<EOF
export PATH=$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH
export GENIE=$GENIE
EOF

}
