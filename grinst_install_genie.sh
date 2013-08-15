#!/bin/bash

grinst_install_genie () {
    local version=$1; shift
    local prefix=$1 ; shift

    source $(grinst_setup python)
    source $(grinst_setup pythia6)
    source $(grinst_setup lhapdf)
    source $(grinst_setup log4cpp)
    source $(grinst_setup root)

    local _version_=$(echo $version | tr '.' '_')

    local svnurl="http://genie.hepforge.org/svn"
    if [ "$version" = "trunk" ] ; then
	svnurl="${svnurl}/trunk"
    else
	svnurl="${svnurl}/branches/R-${_version_}"
    fi
    local unpacked="genie-source"

    svnco $svnurl $unpacked

    local srcdir=$(readlink -f $unpacked)
    apply_patches

    pushd "$unpacked"
    export GENIE=$(pwd)

    mkdir -p $prefix		# genie install is incompetent to do this itself

    ./configure --prefix="$prefix" \
	--enable-numi \
	--enable-nucleon-decay \
	--enable-rwght \
	--with-pythia6-lib=${pythia6_install_dir}/lib \
	--with-lhapdf-inc=${lhapdf_install_dir}/include \
	--with-lhapdf-lib=${lhapdf_install_dir}/lib \
	--with-log4cpp-inc=${log4cpp_install_dir}/include \
	--with-log4cpp-lib=${log4cpp_install_dir}/lib 
    make 
    make utils
    make install

    # handle incomplete build
    mkdir $prefix/src
    cp -a src/make $prefix/src/
    cp -a src/scripts $prefix/src/

    popd
    
}
