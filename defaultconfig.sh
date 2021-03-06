#!/bin/bash

# example configuration for grinst

# REQUIRED

# Where things are or to be installed
grinst_target=/data0/lbne/bv/grinst

# list of packages
grinst_packages="cmake python ipython geant4 gccxml root"

# each package needs a _version variable
cmake_version=2.8.7
python_version=2.7.2
ipython_version=0.12
geant4_version=4.9.5.p01
gccxml_version=0.9.0_20120309
root_version=5.32.02


## REQUIRED KLUDGE

# Geant4 puts data in directories only partially named after version strings
geant4_datadir=share/Geant4-9.5.1


## OPTIONAL

# parallel make
grinst_parallel=-j8