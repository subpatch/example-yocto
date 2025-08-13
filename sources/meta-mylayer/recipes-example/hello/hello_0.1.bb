SUMMARY = "A simple Python script that prints Hello, World!"
DESCRIPTION = ""
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

SRC_URI = "file://hello.py"

S = "${UNPACKDIR}"

#inherit setuptools

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${S}/hello.py ${D}${bindir}/hello
}

RDEPENDS:${PN} += "python3"
