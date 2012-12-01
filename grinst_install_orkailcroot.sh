#!/bin/bash

# this installs the ORKA-ILCRoot software

grinst_install_orkailcroot () {
    # fixme: pull from Redmine git once it is set up
    local version=$1; shift
    local prefix=$1 ; shift

    eval $(grinst_setup cernlib)
    eval $(grinst_setup cmake)
    eval $(grinst_setup python)
    eval $(grinst_setup geant4)
    eval $(grinst_setup root)
    eval $(grinst_setup geant3vmc)


    # fixme: need to change when switch to redmine git
    # Read-only:
    # giturl=git://github.com/brettviren/ORKA-ILCRoot.git
    # Commit:
    #giturl=git@github.com:brettviren/ORKA-ILCRoot.git
    giturl=http://cdcvs.fnal.gov/projects/orka-ilcroot
    gitco $giturl $version

    local srcdir="$(pwd)/$(basename $giturl)"

    export ILC_ROOT=$srcdir
    export ILC_INSTALL=$prefix

    local blddir="$(basename $giturl .git)-cmake-build"
    assuredir $blddir
    pushd $blddir
    cmake -DCMAKE_INSTALL_PREFIX=$prefix  $srcdir

    make -j4
    make install
}
