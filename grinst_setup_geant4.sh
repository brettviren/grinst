#!/bin/bash

grinst_setup_geant4 () {
    local prefix=$1; shift

    local geant4_data=$prefix/$geant4_datadir

    PATH=$(pathadd $prefix/bin $PATH)
    LD_LIBRARY_PATH=$(pathadd $prefix/lib64 $LD_LIBRARY_PATH)

    cat <<EOF
export PATH=$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH

export G4ABLADATA="$geant4_data/G4ABLA3.0"
export G4LEDATA="$geant4_data/G4EMLOW6.23"
export G4LEVELGAMMADATA="$geant4_data/PhotonEvaporation2.2"
export G4NEUTRONHPDATA="$geant4_data/G4NDL4.0"
export G4NEUTRONXSDATA="$geant4_data/G4NEUTRONXS1.1"
export G4PIIDATA="$geant4_data/G4PII1.3"
export G4RADIOACTIVEDATA="$geant4_data/RadioactiveDecay3.4"
export G4REALSURFACEDATA="$geant4_data/RealSurface1.0"

EOF
}
