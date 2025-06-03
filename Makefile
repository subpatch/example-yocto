# Internal Makefile for maintaining and testing the project.

SHELL=bash

#SUBPATCH=$(HOME)/git/subpatch/subpatch.py
SUBPATCH=subpatch

.PHONY: add
add:
	mkdir -p sources
	cd sources && $(SUBPATCH) add https://git.yoctoproject.org/poky -r refs/heads/scarthgap
	cd sources && $(SUBPATCH) add https://git.openembedded.org/meta-openembedded -r refs/heads/scarthgap
	cd sources && $(SUBPATCH) add https://git.yoctoproject.org/meta-raspberrypi -r refs/heads/scarthgap
	git commit -m "add layers"


.PHONY: create
create:
	. sources/poky/oe-init-build-env ; \
		bitbake-layers create-layer ../sources/meta-mylayer && \
		bitbake-layers add-layer ../sources/meta-mylayer && \
		git add ../sources/meta-mylayer && \
		git commit -m "add own layer"

.PHONY: save
save:
	. sources/poky/oe-init-build-env ; \
		bitbake-layers save-build-conf ../sources/meta-mylayer/ myconf && \
		git add ../sources/meta-mylayer/conf/templates/myconf/ && \
		git commit -m "add my template"

.PHONY: add-layers
add-layers:
	. sources/poky/oe-init-build-env ; \
		bitbake-layers add-layer ../sources/meta-openembedded/meta-oe && \
		bitbake-layers add-layer ../sources/meta-openembedded/meta-python && \
		bitbake-layers add-layer ../sources/meta-raspberrypi

.PHONY: build
build:
	. sources/poky/oe-init-build-env ; \
		bitbake my-image

.PHONY: update
update:
	$(SUBPATCH) update sources/poky
	$(SUBPATCH) update sources/meta-openembedded
	$(SUBPATCH) update sources/meta-raspberrypi
