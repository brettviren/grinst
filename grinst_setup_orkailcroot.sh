#!/bin/bash

grinst_setup_orkailcroot () {
    eval $(grinst_setup cernlib)
    eval $(grinst_setup cmake)
    eval $(grinst_setup python)
    eval $(grinst_setup geant4)
    eval $(grinst_setup root)
    eval $(grinst_setup geant3vmc)

}


