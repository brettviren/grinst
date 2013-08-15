#!/bin/bash

# fixme: this is a stub

grinst_setup_wbls () {
    local prefix=$1; shift

cat <<EOF
    source $(grinst_setup ipython)
    source $(grinst_setup root)
    source $(grinst_setup geant4)
    source $(grinst_setup vgm)
EOF
}
