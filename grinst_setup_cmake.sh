#!/bin/bash

grinst_setup_cmake () {
    local prefix=$1; shift
    cat <<EOF
export PATH=\$(pathadd $prefix/bin \$PATH)
EOF
}
