#!/bin/bash

grinst_setup_geant4 () {
    local prefix=$1; shift
    local datadir=$(ls -d $prefix/share/*/data | tail -1)
    cat <<EOF
export PATH=\$(pathadd $prefix/bin \$PATH)
LD_LIBRARY_PATH=\$(pathadd $prefix/lib64 \$LD_LIBRARY_PATH)
LD_LIBRARY_PATH=\$(pathadd $prefix/lib \$LD_LIBRARY_PATH)
export LD_LIBRARY_PATH
export geant4_data=$datadir
EOF


    dir=$(ls -d $datadir/G4ABLA* 2>/dev/null | tail -1)
    if [ -n "$dir" ] ; then 
	G4ABLADATA=$dir
	echo "export G4ABLADATA=$dir"
    fi

    dir=$(ls -d $datadir/G4EMLOW* 2>/dev/null | tail -1)
    if [ -n "$dir" ] ; then 
	G4LEDATA=$dir
	echo "export G4LEDATA=$dir"
    fi

    dir=$(ls -d $datadir/PhotonEvaporation* 2>/dev/null | tail -1)
    if [ -n "$dir" ] ; then 
	G4LEVELGAMMADATA=$dir
	echo "export G4LEVELGAMMADATA=$dir"
    fi

    dir=$(ls -d $datadir/G4NDL* 2>/dev/null | tail -1)
    if [ -n "$dir" ] ; then 
	G4NEUTRONHPDATA=$dir
	echo "export G4NEUTRONHPDATA=$dir"
    fi

    dir=$(ls -d $datadir/G4NEUTRONXS* 2>/dev/null | tail -1)
    if [ -n "$dir" ] ; then 
	G4NEUTRONXSDATA=$dir
	echo "export G4NEUTRONXSDATA=$dir"
    fi

    dir=$(ls -d $datadir/PII* 2>/dev/null | tail -1)
    if [ -n "$dir" ] ; then 
	G4PIIDATA=$dir
	echo "export G4PIIDATA=$dir"
    fi

    dir=$(ls -d $datadir/RadioactiveDecay* 2>/dev/null | tail -1)
    if [ -n "$dir" ] ; then 
	G4RADIOACTIVEDATA=$dir
	echo "export G4RADIOACTIVEDATA=$dir"
    fi

    dir=$(ls -d $datadir/RealSurface* 2>/dev/null | tail -1)
    if [ -n "$dir" ] ; then 
	G4REALSURFACEDATA=$dir
	echo "export G4REALSURFACEDATA=$dir"
    fi

    dir=$(ls -d $datadir/G4SAIDDATA* 2>/dev/null | tail -1)
    if [ -n "$dir" ] ; then 
	G4SAIDXSDATA=$dir
	echo "export G4SAIDXSDATA=$dir"
    fi

}
