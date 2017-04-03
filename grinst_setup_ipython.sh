#!/bin/bash

grinst_setup_ipython() {
    local prefix=$1; shift
cat <<EOF
source $(grinst_setup python)
export PATH=\$(pathadd $prefix/bin \$PATH)
export PYTHONPATH=\$(pathadd $prefix/lib/python2.*/site-packages \$PYTHONPATH)
EOF
}
