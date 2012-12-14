#!/bin/bash

grinst_setup_geant4 () {
    local prefix=$1; shift

    local geant4_data=$prefix/$geant4_datadir

    PATH=$(pathadd $prefix/bin $PATH)
    LD_LIBRARY_PATH=$(pathadd $prefix/lib64 $LD_LIBRARY_PATH)
    LD_LIBRARY_PATH=$(pathadd $prefix/lib $LD_LIBRARY_PATH)

    

    cat <<EOF
export PATH=$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH
EOF

    local datadir=$(ls -d $prefix/share/*/data | tail -1)

    dir=$(ls -d $geant4_data/G4ABLA* | tail -1)
    if [ -n "$dir" ] ; then 
	G4ABLADATA=$dir
	echo "export G4ABLADATA=$dir"
    fi

    dir=$(ls -d $geant4_data/G4EMLOW* | tail -1)
    if [ -n "$dir" ] ; then 
	G4LEDATA=$dir
	echo "export G4LEDATA=$dir"
    fi

    dir=$(ls -d $geant4_data/PhotonEvaporation* | tail -1)
    if [ -n "$dir" ] ; then 
	G4LEVELGAMMADATA=$dir
	echo "export G4LEVELGAMMADATA=$dir"
    fi

    dir=$(ls -d $geant4_data/G4NDL** | tail -1)
    if [ -n "$dir" ] ; then 
	G4NEUTRONHPDATA=$dir
	echo "export G4NEUTRONHPDATA=$dir"
    fi

    dir=$(ls -d $geant4_data/G4NEUTRONXS* | tail -1)
    if [ -n "$dir" ] ; then 
	G4NEUTRONXSDATA=$dir
	echo "export G4NEUTRONXSDATA=$dir"
    fi

    dir=$(ls -d $geant4_data/PII* | tail -1)
    if [ -n "$dir" ] ; then 
	G4PIIDATA=$dir
	echo "export G4PIIDATA=$dir"
    fi

    dir=$(ls -d $geant4_data/RadioactiveDecay* | tail -1)
    if [ -n "$dir" ] ; then 
	G4RADIOACTIVEDATA=$dir
	echo "export G4RADIOACTIVEDATA=$dir"
    fi

    dir=$(ls -d $geant4_data/RealSurface* | tail -1)
    if [ -n "$dir" ] ; then 
	G4REALSURFACEDATA=$dir
	echo "export G4REALSURFACEDATA=$dir"
    fi

}
