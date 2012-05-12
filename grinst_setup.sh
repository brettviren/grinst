#!/bin/bash

grinst_setup () {
    local package=$1 ; shift
    
    if [ "$package" = "all" ] ; then
	for package in $grinst_packages
	do
	    grinst_setup $package
	done
	return
    fi
    
    local version=$(resolve ${package}_version)
    install_dir=$grinst_target/install/$package/$version

    echo "export $grinst_${package}_install_dir=$install_dir"

    source $grinst_dir/grinst_setup_$package.sh
    grinst_setup_$package $install_dir
}
