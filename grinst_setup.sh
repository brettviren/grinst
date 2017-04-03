#!/bin/bash

# Create a setup file for the given package.
grinst_setup () {
    local package=$1 ; shift
    
    if [ ! -f "$grinst_setup_env_dir/grinst_env_util.sh" ] ; then
	cp $grinst_dir/grinst_env_util.sh $grinst_setup_env_dir
    fi

    if [ "$package" = "all" ] ; then
	allenvfile="$grinst_setup_env_dir/grinst_setup_env_all.sh"
	if [ -f $allenvfile ] ; then
	    echo $allenvfile
	    return
	fi
	for package in $grinst_packages
	do
	    pkgenvfile=$(grinst_setup $package)
	    echo "source $pkgenvfile" >> $allenvfile
	done
	echo $allenvfile
	return
    fi
    
    local version=$(resolve ${package}_version)
    install_dir=$grinst_install_target/$package/$version

    pkgenvfile="$grinst_setup_env_dir/grinst_setup_env_$package.sh"
    if [ -f $pkgenvfile ] ; then
	echo $pkgenvfile
	return
    fi

    cat <<EOF >> $pkgenvfile
if [ -z "\$${package}_install_dir" ] ; then
source $grinst_setup_env_dir/grinst_env_util.sh
export ${package}_install_dir=$install_dir
EOF
    source $grinst_dir/grinst_setup_$package.sh
    grinst_setup_$package $install_dir >> $pkgenvfile
    echo "fi" >> $pkgenvfile

    echo $pkgenvfile
}
