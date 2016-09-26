################################################################################
#
# USB_SCRIPTS
#
################################################################################

USB_SCRIPTS_VERSION = master
USB_SCRIPTS_SOURCE = $(USB_SCRIPTS_VERSION).tar.gz
USB_SCRIPTS_SITE = https://github.com/synopsys-usb/usb-scripts/archive
USB_SCRIPTS_INSTALL_TARGET = YES
USB_SCRIPTS_LICENSE = BSD
USB_SCRIPTS_LICENSE_FILES = LICENSE

define USB_SCRIPTS_BUILD_CMDS
	$(MAKE) CC=$(TARGET_CROSS)gcc LD=$(TARGET_LD) -C $(@D)
endef

define USB_SCRIPTS_INSTALL_TARGET_CMDS
	$(MAKE) -C $(@D) prefix=$(TARGET_DIR)/root/bin libdir=/root/bin/dwc_utils install
endef

$(eval $(generic-package))
