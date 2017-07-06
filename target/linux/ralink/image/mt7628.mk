#
# MT7628 Profiles
#

USB_SD_STORAGE_BASE_PACKAGES := kmod-mt762x-mmc kmod-usb-core kmod-usb2 kmod-usb-ohci kmod-usb-storage kmod-usb-storage-extras kmod-scsi-core kmod-scsi-cdrom \
		kmod-ledtrig-usbport
		
SATA_AHCI_STORAGE_BASE := kmod-ata-core kmod-ata-ahci 

PRINTER_PACKAGES :=luci-app-usb-printer luci-i18n-usb-printer-zh-cn kmod-usb-printer p910nd 

WIFI_PACKAGES_2G := kmod-mt7628
WIFI_PACKAGES_5G := kmod-mt76x2e

STORAGE_UTILS_PACKAGES_FULL := $(USB_SD_STORAGE_BASE_PACKAGES) kmod-nls-cp437 kmod-nls-cp936 kmod-nls-iso8859-1 kmod-nls-utf8 \
			kmod-fs-ufsd kmod-fs-vfat kmod-fs-ext4 kmod-fs-exfat \
			fdisk hdparm ufsd-tools mkdosfs exfat-utils libext2fs e2fsprogs cfdisk parted \
			vsftpd samba3-pandorabox pbmsa-utils \
			luci-app-samba luci-i18n-samba-zh-cn luci-app-vsftpd luci-i18n-vsftpd-zh-cn
			
STORAGE_UTILS_PACKAGES_LITE := $(USB_SD_STORAGE_BASE_PACKAGES) kmod-nls-cp437 kmod-nls-cp936 kmod-nls-iso8859-1 kmod-nls-utf8 \
			kmod-fs-ufsd kmod-fs-vfat kmod-fs-ext4 kmod-fs-exfat \
			samba3-pandorabox pbmsa-utils \
			luci-app-samba luci-i18n-samba-zh-cn
			
USB_3G_DONGLE_PACKAGES := luci-proto-3g comgt kmod-usb-net  kmod-usb-net-rndis kmod-usb-net-sierrawireless kmod-usb-net-qmi-wwan \
		kmod-usb-serial kmod-usb-serial-option kmod-usb-serial-wwan chat

PACKAGES_8M_FLASH_USB :=$(STORAGE_UTILS_PACKAGES_LITE) detect_internet

PACKAGES_16M_FLASH :=$(STORAGE_UTILS_PACKAGES_FULL) $(USB_3G_DONGLE_PACKAGES) $(PRINTER_PACKAGES) detect_internet

define Device/mt7628a-evb
  BOARDNAME := MT7628A_EVB
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := MediaTek MT7628a Evaluation Board
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(WIFI_PACKAGES_2G) $(WIFI_PACKAGES_5G) 
endef
TARGET_DEVICES += mt7628a-evb

define Device/xiaomi-r1cl
  BOARDNAME := XIAOMI_R1CL
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := Xiaomi R1CL
  DEVICE_PACKAGES :=$(WIFI_PACKAGES_2G) detect_internet
endef
TARGET_DEVICES += xiaomi-r1cl

define Device/pbr-w3
  BOARDNAME := PBR_W3
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := PBR-W3
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(WIFI_PACKAGES_2G) $(WIFI_PACKAGES_5G) 
endef
TARGET_DEVICES += pbr-w3

define Device/pbr-bhu
  BOARDNAME := PBR_BHU
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := PBR-BHU
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(WIFI_PACKAGES_2G)
endef
TARGET_DEVICES += pbr-bhu

define Device/360safe-p2
  BOARDNAME := 360Safe_P2
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := 360Safe-P2
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(WIFI_PACKAGES_2G) $(WIFI_PACKAGES_5G) 
endef
TARGET_DEVICES += 360safe-p2

define Device/pbr-c1
  BOARDNAME := PBR_C1
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := PBR-C1
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(WIFI_PACKAGES_2G)
endef
TARGET_DEVICES += pbr-c1

define Device/pbr-d1
  BOARDNAME := PBR_D1
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := PBR-D1
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(WIFI_PACKAGES_2G)
endef
TARGET_DEVICES += pbr-d1

define Device/dm06
  BOARDNAME := DM06
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := dm06
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(WIFI_PACKAGES_2G)
endef
