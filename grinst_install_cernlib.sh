#!/bin/bash

grinst_install_cernlib () {
    local version=$1; shift
    local prefix=$1 ; shift

    urlbase=http://cernlib.web.cern.ch/cernlib/download/${version}/tar/
    local what=""
    for what in cernlib cernbin include
    do
	local tarfile=${what}.tar.gz
	download ${urlbase}/${tarfile}
	untar $tarfile
    done

    local bindir=$(echo $version | sed 's,_,/,')
    local subdir=$(echo $version | sed 's,_.*,,')

    assuredir $prefix
    cp -a $subdir/include $bindir/{bin,lib} $prefix
}
