#!/bin/bash

# fixme: this doesn't yet follow the right grinst patterns

grinst_setup_cowbells () {
    local prefix=$1; shift	# fixme: ignoring for now
    cat <<EOF
source $(grinst_setup root)
source $(grinst_setup geant4)
source $(grinst_setup ipython)
export cowbells_dir=/home/bv/work/wbls/cowbells
export cowbells_build_dir=\${cowbells_dir}-build
export PATH=\$(pathadd \$PATH \$cowbells_build_dir/bin \$cowbells_dir/share)
export LD_LIBRARY_PATH=\$(pathadd \$cowbells_build_dir/lib \$LD_LIBRARY_PATH)
export PYTHONPATH=\$(pathadd \$cowbells_dir/python \$PYTHONPATH)
cowbells-build ()
{
    if [ ! -d \$cowbells_build_dir ] ; then
	mkdir -p \$cowbells_build_dir
    fi
    pushd \$cowbells_build_dir
    if [ ! -f CMakeFiles ] ; then
	cmake -DHEPMC_DIR="\$hepmc_install_dir" \$cowbells_dir
    fi
    make
    popd
}
EOF
}
