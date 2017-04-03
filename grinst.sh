#!/bin/bash

grinst_dir=$(readlink -f $(dirname $BASH_SOURCE))

grinst_setup_env_dir=$(mktemp -d /tmp/grinst.$USER.XXXXXXXX)


source $grinst_dir/grinst_util.sh
source $grinst_dir/grinst_env_util.sh

set_target () {
    what=$1 ; shift
    var=$(resolve grinst_${what}_target)
    if [ -n "${var}" ] ; then	# explicitly defined 
	return
    fi
    if [ -z "$grinst_target" ] ; then
	error "Can not set \"$var\""
    fi
    eval grinst_${what}_target=${grinst_target}/$what
}

main () {
    local config=$1 ; shift
    if [ -z "$config" -o ! -f "$config" ] ; then
	error "No config file given"
    fi

    local command=$1; shift
    if [ -z "$command" ] ; then
	error "No command given"
    fi

    source $config
    set_target build
    set_target install

    local package
    for package in $grinst_packages
    do
	local var=$(resolve ${package}_version)
	if [ -z "$var" ] ; then
	    error "No version for package \"$package\""
	fi
    done

    source $grinst_dir/grinst_install.sh

    source $grinst_dir/grinst_setup.sh
    
    grinst_$command $@
}

main $@

