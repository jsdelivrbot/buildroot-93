################################################################################
#
# USB_SCRIPTS
#
################################################################################

USB_SCRIPTS_VERSION = master
USB_SCRIPTS_SITE = http://nanobot/git/dwc/usb-scripts.git
USB_SCRIPTS_SITE_METHOD = git
USB_SCRIPTS_INSTALL_TARGET = YES
USB_SCRIPTS_LICENSE = GPLv2+
USB_SCRIPTS_LICENSE_FILES = COPYING

define USB_SCRIPTS_BUILD_CMDS
	$(MAKE) CC=$(TARGET_CROSS)gcc LD=$(TARGET_LD) -C $(@D)
endef

define USB_SCRIPTS_INSTALL_TARGET_CMDS
	$(MAKE) -C $(@D) prefix=$(TARGET_DIR)/root libdir=/root/dwc_utils install
endef

$(eval $(generic-package))
