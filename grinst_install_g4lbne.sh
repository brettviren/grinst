#!/bin/bash

# make a CMakeLists.txt to build g4lbne
g4lbne_spit_cmakelists () {
    srcdir=$1 ; shift

cat <<EOF > $srcdir/CMakeLists.txt
cmake_minimum_required(VERSION 2.6 FATAL_ERROR)

project(g4lbne)

# Hook into Geant4
find_package(Geant4 REQUIRED)
include(\${Geant4_USE_FILE})

# Hook into ROOT
find_package(ROOT REQUIRED)
include(\${ROOT_USE_FILE})

include_directories(\${PROJECT_SOURCE_DIR}/include)
file(GLOB sources \${PROJECT_SOURCE_DIR}/src/*.cc)
file(GLOB headers \${PROJECT_SOURCE_DIR}/include/*.hh)

ROOT_GENERATE_DICTIONARY(g4lbnedict \${PROJECT_SOURCE_DIR}/include/TrackPoint_t.hh \${PROJECT_SOURCE_DIR}/include/LBNEDataNtp_t.hh  LINKDEF Linkdef.h OPTIONS -p)

add_executable(g4lbne g4lbne.cc \${sources} \${headers} g4lbnedict.cxx)
target_link_libraries(g4lbne \${Geant4_LIBRARIES} \${ROOT_LIBRARIES} Tree)

EOF
}


grinst_install_g4lbne () {
    local version=$1; shift
    local prefix=$1 ; shift

    source $(grinst_setup cmake)
    source $(grinst_setup geant4)
    source $(grinst_setup root)

### CVS puts things in a sub-subdir
#    local srcdir=lbne-beamsim/g4lbne
### Git doesn't
    local srcdir=g4lbne
    local blddir=${srcdir}-cmake-build

    # this is read-only
#    if [ -d "$srcdir" ] ; then
#	echo "CVS module \"$srcdir\" already checked out"
#    else
#	cvs -d :pserver:anonymous@cdcvs.fnal.gov:/cvs/projects/lbne-beamsim checkout -D "2012-06-12 00:00:00 GMT" $srcdir 
#    fi
    # this is a git cvsimport of the above
    local giturl="https://github.com/DUNE/g4lbne.git"
    local gittag="master"
    gitco $giturl $gittag $srcdir

    srcdir=$(readlink -f $srcdir)

    assuredir $blddir
    pushd $blddir
    g4lbne_spit_cmakelists $srcdir

    cmake -DCMAKE_INSTALL_PREFIX=$prefix  $srcdir
    make

    assuredir $prefix/bin
    cp g4lbne $prefix/bin/
    popd
}

