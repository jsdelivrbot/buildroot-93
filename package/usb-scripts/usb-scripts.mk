################################################################################
#
# USB_SCRIPTS
#
################################################################################

USB_SCRIPTS_SOURCE = usb-scripts.tar.gz
USB_SCRIPTS_SITE = http://nanobot/usb-scripts/latest
USB_SCRIPTS_INSTALL_TARGET = YES
USB_SCRIPTS_LICENSE = BSD
USB_SCRIPTS_LICENSE_FILES = COPYING

define USB_SCRIPTS_BUILD_CMDS
	$(MAKE) CC=$(TARGET_CROSS)gcc LD=$(TARGET_LD) -C $(@D)
endef

define USB_SCRIPTS_INSTALL_TARGET_CMDS
	$(MAKE) -C $(@D) prefix=$(TARGET_DIR)/root/bin libdir=/root/bin/dwc_utils install
endef

$(eval $(generic-package))
