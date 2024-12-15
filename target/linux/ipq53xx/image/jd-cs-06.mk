define Device/FitImage
	KERNEL_SUFFIX := -uImage.itb
	KERNEL = kernel-bin | libdeflate-gzip | fit gzip $$(KDIR)/image-$$(DEVICE_DTS).dtb
	KERNEL_NAME := Image
endef

define Device/FitImageLzma
	KERNEL_SUFFIX := -uImage.itb
	KERNEL = kernel-bin | lzma | fit lzma $$(KDIR)/image-$$(DEVICE_DTS).dtb
	KERNEL_NAME := Image
endef

define Device/UbiFit
	KERNEL_IN_UBI := 1
	IMAGES := factory.ubi sysupgrade.bin
	IMAGE/factory.ubi := append-ubi
	IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef

define Device/EmmcImage
	IMAGES := factory.bin recovery.bin sysupgrade.bin
	IMAGE/factory.bin := append-kernel | pad-to 12288k | append-rootfs | append-metadata
	IMAGE/recovery.bin := append-kernel | pad-to 6144k | append-rootfs | append-metadata
	IMAGE/sysupgrade.bin/squashfs := append-rootfs | pad-to 64k | sysupgrade-tar rootfs=$$$$@ | append-metadata
endef

define Device/jdcloud_re-cs-06
	$(call Device/FitImage)
	$(call Device/EmmcImage)
	DEVICE_VENDOR := JDCloud
	DEVICE_MODEL := BE6500
	SOC := ipq5233
	BLOCKSIZE := 64k
	KERNEL_SIZE := 6144k
	DEVICE_DTS_CONFIG := config@cp03-c3
	DEVICE_PACKAGES := ipq-wifi-jdcloud_ax6600 kmod-ath11k-pci ath11k-firmware-qcn9074
endef
TARGET_DEVICES += jdcloud_re-cs-06
