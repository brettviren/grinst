#!/bin/bash

grinst_setup_genie () {
    local prefix=$1; shift
cat<<EOF
source $(grinst_setup python)
source $(grinst_setup pythia6)
source $(grinst_setup lhapdf)
source $(grinst_setup log4cpp)
source $(grinst_setup root)
export PATH=]$(pathadd $prefix/bin ]$PATH)
export LD_LIBRARY_PATH=\$(pathadd $prefix/lib \$LD_LIBRARY_PATH)
export GENIE=$prefix
EOF
}
