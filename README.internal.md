# Internal README

## Tests

How to test template conf

    $ rm -rf build/conf/

and then resetup.

## TODOs

Add a own small distro based on systemd and then add small python based
services. It's a better embedded example than just a program.

Upgrade to new yocto version. My local changes

    # sources/meta-mylayer/conf/layer.conf
    LAYERSERIES_COMPAT_meta-mylayer = "styhead"

    # sources/meta-mylayer/recipes-example/hello/hello_0.1.bb
    S = "${UNPACKDIR}"
