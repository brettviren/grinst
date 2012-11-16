#!/bin/bash

grinst_install_log4cpp () {
    local version=$1; shift
    local prefix=$1 ; shift

    local norc="log4cpp-$(echo $version | sed -e 's/rc.*//')"
    local tmpunpacked=log4cpp
    local unpacked=${tmpunpacked}-${version}
    local tarball="${unpacked}.tar.gz"
    local filesurl="http://sourceforge.net/projects/log4cpp/files"
    local url="${filesurl}/${norc}.x%20%28new%29/${norc}/${tarball}"

    download "$url"
    if [ ! -d root ] ; then
	untar "$tarball" "$unpacked"
    fi
    if [ -d $tmpunpacked ] ; then
	mv $tmpunpacked $unpacked
    fi

    pushd "$unpacked"

    ./configure --prefix="$prefix"
    make 
    make install

    popd
    
}

