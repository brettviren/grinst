grinst
======

A simple script to assist in installing Geant4/ROOT and related
packages.

How to use
----------

Install packages like:

```shell
grinst.sh configfile install all
```

Set up Borne shell environment like:

```shell
eval $(grinst.sh configfile setup all)
```

Instead of `all` a list of explicit packages can be given.  Ordering
should reflect dependencies.

How to configure
----------------

The `configfile` given needs to specify the base directory to hold the
installation, package versions and a few other things.  See the
`defaultconfig.sh` file for an illustrative example.

How to hack
-----------

Each package needs an install and an environment setup script that
follows some conventions.

### Install script

The script should be named like `grinst_install_PACKAGENAME` and is
passed the version name and the prefix directory to install into.  

It should call `eval $(grinst_setup PACKAGENAME)` for any packages it
depends on.  It is out of scope of this script if they have actually
been installed.

### Setup script

The script should be named like `grinst_setup_PACKAGENAME` and is pass
the prefix directory that the package should be installed to.  It
should echo any Bourne shell setup code (`*csh` users can go take a
hike).

### Utilities

There are various functions in `grinst_util.sh` that are available
when developing the install and setup scripts.
