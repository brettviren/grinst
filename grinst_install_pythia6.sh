#!/bin/bash

# set PYTHIA_DIR for ROOT to find this

grinst_install_pythia6 () {
    local version=$1; shift
    local prefix=$1 ; shift
    
    # ignore upstream and take from root regardless of version
    #url=http://www.hepforge.org/archive/pythia6/pythia-${version}.f.gz
    local unpacked="pythia6"
    local tarball="pythia6.tar.gz"
    local url="ftp://root.cern.ch/root/pythia6.tar.gz"
    download "$url"
    untar "$tarball" "$unpacked"
    local srcdir="$(readlink -f $unpacked)"
    
    pushd "$srcdir"

    # by hand, uhg.
    local flags="-c -fPIC"
    local archflags=""		# maybe -m64

    echo 'void MAIN__() {}' >main.c

    gfortran $flags $archflags pythia*.f
    gfortran $flags $archflags -fno-second-underscore tpythia6_called_from_cc.F
    gcc $flags $archflags main.c
    gcc $flags $archflags pythia6_common_address.c
    gfortran $archflags -shared -Wl,-soname,libPythia6.so -o libPythia6.so \
                         main.o  pythia*.o tpythia*.o

    assuredir "${prefix}/lib"
    cp libPythia6.so ${prefix}/lib
}

