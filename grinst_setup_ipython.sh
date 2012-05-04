#!/bin/bash

grinst_setup_ipython() {
    local prefix=$1; shift

    eval $(grinst_setup python)
    grinst_setup python

    cat <<EOF
export PATH=$(pathadd $prefix/bin $PATH)
export PYTHONPATH=$(pathadd $prefix/lib/python2.7/site-packages $PYTHONPATH)
EOF

    # fixme: hardcodes python 2.7 version, but whatchya gonna do?
}
