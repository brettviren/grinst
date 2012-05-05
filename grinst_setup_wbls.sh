#!/bin/bash

grinst_setup_wbls () {
    local prefix=$1; shift

    eval $(grinst_setup ipython)
    eval $(grinst_setup root)
    eval $(grinst_setup geant4)
    eval $(grinst_setup vgm)

    grinst_setup ipython
    grinst_setup root
    grinst_setup geant4
    grinst_setup vgm
    

    ....
}