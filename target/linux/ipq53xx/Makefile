include $(TOPDIR)/rules.mk

ARCH:=aarch64
BOARD:=ipq53xx
BOARDNAME:=Qualcomm Technologies, Inc IPQ53xx
FEATURES:=ubifs squashfs fpu ramdisk nand pcie usbgadget
CPU_TYPE:=cortex-a53
CPU_SUBTYPE:=neon-vfpv4
MAINTAINER:=John Crispin <blogic@openwrt.org>
SUBTARGETS:=generic ipq53xx_32

KERNELNAME:=zImage Image dtbs
LINUX_VERSION:=5.4

include $(INCLUDE_DIR)/target.mk
DEFAULT_PACKAGES += \
	uboot-envtools kmod-leds-gpio kmod-gpio-button-hotplug kmod-button-hotplug \
	kmod-ata-core kmod-ata-ahci kmod-ata-ahci-platform kmod-usb3 swconfig \
	kmod-usb-phy-ipq5018 kmod-usb-dwc3-qcom-internal

$(eval $(call BuildTarget))
