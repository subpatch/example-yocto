# subpatch Yocto example

This repository is part of the [subpatch project](https://subpatch.net).

## Contents

The superproject uses three subprojects

* sources/meta-openembedded
* sources/meta-raspberrypi
* sources/poky

See also `subpatch list`.

For now the layers are tracking the upstream `scarthgap`  branch. See `subpatch
status` for more details.

The local directory `sources/meta-mylayer` is a project local layer and it
contains the default build configuration.

The default build configuration uses the layers

    sources/poky/meta
    sources/poky/meta-poky
    sources/poky/meta-yocto-bsp
    sources/meta-openembedded/meta-oe
    sources/meta-openembedded/meta-python
    sources/meta-raspberrypi
    sources/meta-mylayer

and builds for the machine `raspberrypi5`.

## Building

To build the firmware, execute

    $ TEMPLATECONF=../meta-mylayer/conf/templates/myconf . sources/poky/oe-init-build-env
    $ bitbake my-image

for the first build. And for the later builds, execute

    $ . sources/poky/oe-init-build-env
    $ bitbake my-image


## Flash

After building the flashable firmware files are

    build/tmp/deploy/images/raspberrypi5/my-image-raspberrypi5.rootfs.wic.bz2
    build/tmp/deploy/images/raspberrypi5/my-image-raspberrypi5.rootfs.wic.bmap

You can flash it to an SD-card with

    $ sudo bmaptool copy my-image-raspberrypi5.rootfs.wic.bz2 /dev/sdX


## Run

Insert the SD-card into a RaspberryPi 5 and connect the power.

To get access to the console, either

* connect HDMI and a USB-keyboard or
* connect an UART to the [UART pins](https://pinout.xyz/pinout/uart).

The login user is `root` and has no password.

Then type `hello` to execute the installed command from the *meta-mylayer* and
the image `my-image`.


## Final words

Congratulations. You have seen and used a project that uses subpatch to
assemble a Yocto project.
