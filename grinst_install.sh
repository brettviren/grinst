#!/bin/bash

set_target () {
    what=$1 ; shift
    var=$(resolve grinst_${what}_target)
    if [ -n "${var}" ] ; then	# explicitly defined 
	return
    fi
    if [ -z "$grinst_target" ] ; then
	error "Can not set $var"
    fi
    eval grinst_${what}_target=${grinst_target}/$what
}

grinst_install () {
    local package=$1 ; shift
    echo "Installing package \"$package\""

    if [ "$package" = "all" ] ; then
	for package in $grinst_packages
	do
	    grinst_install $package
	done
	return
    fi

    local version=$(resolve ${package}_version)
    if [ -z "$version" ] ; then
	error "No version for package \"$package\""
    fi

    set_target build
    set_target install

    local build_dir=$grinst_build_target/$package/$version
    assuredir $build_dir

    local install_dir=$grinst_install_target/$package/$version

    source $grinst_dir/grinst_install_$package.sh
    pushd $build_dir
    grinst_install_$package $version $install_dir
    popd
}

