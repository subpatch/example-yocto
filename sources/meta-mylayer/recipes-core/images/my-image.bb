# Simple recipe
SUMMARY = "My simple image"
DESCRIPTION = "simple image based on core-image-minimal.bb"
LICENSE = "MIT"

inherit core-image

IMAGE_INSTALL += " \
    hello \
"
