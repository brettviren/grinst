#!/bin/bash

grinst_setup_g4lbne () {
    local prefix=$1; shift

    for dep in python ipython root geant4
    do
	eval $(grinst_setup $dep)
	grinst_setup $dep
    done

    export PATH=$(pathadd $prefix/bin $PATH)
    export LD_LIBRARY_PATH=$(pathadd $prefix/bin $LD_LIBRARY_PATH)
    cat <<EOF
export PATH=$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH
EOF

}