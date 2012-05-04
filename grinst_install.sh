#!/bin/bash

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

    local build_dir=$grinst_target/build/$package/$version
    assuredir $build_dir

    local install_dir=$grinst_target/install/$package/$version

    source $grinst_dir/grinst_install_$package.sh
    pushd $build_dir
    grinst_install_$package $version $install_dir
    popd
}