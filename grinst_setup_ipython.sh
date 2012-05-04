#!/bin/bash

grinst_setup_ipython() {
    local prefix=$1; shift

    eval $(grinst_setup python)
    grinst_setup python

    PATH=$(pathadd $prefix/bin $PATH)
    PYTHONPATH=$(pathadd $prefix/lib/python2.7/site-packages $PYTHONPATH)
    cat <<EOF
export PATH=$PATH
export PYTHONPATH=$PYTHONPATH
EOF

    # fixme: hardcodes python 2.7 version, but whatchya gonna do?
}
