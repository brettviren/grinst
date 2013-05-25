#!/bin/bash

grinst_setup_geant4 () {
    local prefix=$1; shift
    cat <<EOF
export PATH=\$(pathadd $prefix/bin \$PATH)
LD_LIBRARY_PATH=\$(pathadd $prefix/lib64 \$LD_LIBRARY_PATH)
LD_LIBRARY_PATH=\$(pathadd $prefix/lib \$LD_LIBRARY_PATH)
export LD_LIBRARY_PATH
export geant4_data=\$prefix/\$geant4_datadir

maybe="\$(echo \$geant4_data/G4ABLA*)"
if [ -d "\$maybe" ] ; then
    export G4ABLADATA="\$maybe"
fi

maybe="\$(echo \$geant4_data/G4EMLOW*)"
if [ -d "\$maybe" ] ; then
    export G4LEDATA="\$maybe"
fi

maybe="\$(echo \$geant4_data/PhotonEvaporation*)"
if [ -d "\$maybe" ] ; then
    export G4LEVELGAMMADATA="\$maybe"
fi

maybe="\$(echo \$geant4_data/G4NDL*)"
if [ -d "\$maybe" ] ; then
    export G4NEUTRONHPDATA="\$maybe"
fi

maybe="\$(echo \$geant4_data/G4NEUTRONXS*)"
if [ -d "\$maybe" ] ; then
    export G4NEUTRONXSDATA="\$maybe"
fi

maybe="\$(echo \$geant4_data/G4PII*)"
if [ -d "\$maybe" ] ; then
    export G4PIIDATA="\$maybe"
fi

maybe="\$(echo \$geant4_data/RadioactiveDecay*)"
if [ -d "\$maybe" ] ; then
    export G4RADIOACTIVEDATA="\$maybe"
fi

maybe="\$(echo \$geant4_data/RealSurface*)"
if [ -d "\$maybe" ] ; then
    export G4REALSURFACEDATA="\$maybe"
fi

EOF
}
