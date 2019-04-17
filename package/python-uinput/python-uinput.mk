################################################################################
#
# python-uinput
#
################################################################################

PYTHON_UINPUT_VERSION = befe94a1199a0acc556035ca544bea4b429c20f4
PYTHON_UINPUT_SITE = $(call github,tuomasjjrasanen,python-uinput,$(PYTHON_UINPUT_VERSION))

PYTHON_UINPUT_LICENSE = GPLv3
PYTHON_UINPUT_LICENSE_FILES = LICENSE
PYTHON_UINPUT_SETUP_TYPE = distutils

$(eval $(python-package))