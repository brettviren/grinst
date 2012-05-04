#!/bin/bash

grinst_dir=$(readlink -f $(dirname $BASH_SOURCE))

source $grinst_dir/grinst_util.sh

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

