#!/bin/bash

grinst_install_root () {
    local version=$1; shift
    local prefix=$1 ; shift

    eval $(grinst_setup cmake)
    eval $(grinst_setup gccxml)
    eval $(grinst_setup python)

    local unpacked="root_v${version}.source"
    local tarball="${unpacked}.tar.gz"
    local url="ftp://root.cern.ch/root/$tarball"

    download "$url"
    untar "$tarball" "$unpacked"
    mv root $unpacked

    # pushd $unpacked
    # patch -p1 < $grinst_dir/root-v5.32.02-cmake.patch
    # popd

    local srcdir=$(readlink -f $unpacked)

    local blddir="$root_v${version}-cmake-build"
    assuredir $blddir
    pushd $blddir

    ## Debian + gcc 4.6.3 lacks some obsolete headers.  Some but not
    ## all can be installed in a non-standard location.  Reported to
    ## roottalk.  Since it is not a full fix, don't bother here, but
    ## this is how non-standard locations can be injected:
    # -DCMAKE_CXX_FLAGS:STRING='-I/usr/include/lsb3/c++/backward' 

    cmake $srcdir \
          -DCMAKE_INSTALL_PREFIX=$prefix 
    make $grinst_parallel
    make install
}