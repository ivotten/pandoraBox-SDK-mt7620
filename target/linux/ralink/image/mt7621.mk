#
# MT7621 Profiles
#

USB_SD_STORAGE_BASE_PACKAGES := kmod-mt762x-mmc kmod-usb-core kmod-usb3 kmod-usb-storage kmod-usb-storage-extras kmod-scsi-core kmod-scsi-cdrom \
		kmod-ledtrig-usbport
		
SATA_AHCI_STORAGE_BASE := kmod-ata-core kmod-ata-ahci 

PRINTER_PACKAGES :=luci-app-usb-printer luci-i18n-usb-printer-zh-cn kmod-usb-printer p910nd 

RTC_PACKAGES := kmod-i2c-core kmod-ralink-i2c kmod-rtc-pcf8563 kmod-gpio-pcf857x

WIFI_PACKAGES_2G := kmod-mt7603e
WIFI_PACKAGES_5G := kmod-mt76x2e

STORAGE_UTILS_PACKAGES_FULL := $(USB_SD_STORAGE_BASE_PACKAGES) kmod-nls-cp437 kmod-nls-cp936 kmod-nls-iso8859-1 kmod-nls-utf8 \
			kmod-fs-ufsd kmod-fs-vfat kmod-fs-ext4 kmod-fs-exfat \
			fdisk hdparm ufsd-tools mkdosfs dosfsck exfat-utils libext2fs e2fsprogs cfdisk parted \
			vsftpd samba4-server pbr-optimizer \
			luci-proto-ppp luci-app-samba luci-i18n-samba-zh-cn luci-app-vsftpd luci-i18n-vsftpd-zh-cn
			
STORAGE_UTILS_PACKAGES_LITE := $(USB_SD_STORAGE_BASE_PACKAGES) kmod-nls-cp437 kmod-nls-cp936 kmod-nls-iso8859-1 kmod-nls-utf8 \
			kmod-fs-ufsd kmod-fs-vfat kmod-fs-ext4 kmod-fs-exfat \
			samba4-server pbr-optimizer \
			luci-proto-ppp luci-app-samba luci-i18n-samba-zh-cn
			
USB_3G_DONGLE_PACKAGES := luci-proto-3g comgt kmod-usb-net  kmod-usb-net-rndis kmod-usb-net-sierrawireless kmod-usb-net-qmi-wwan \
		kmod-usb-serial kmod-usb-serial-option kmod-usb-serial-wwan chat


PACKAGES_8M_FLASH_NOUSB := detect_internet

PACKAGES_8M_FLASH_USB :=$(STORAGE_UTILS_PACKAGES_LITE) detect_internet

PACKAGES_16M_FLASH :=$(STORAGE_UTILS_PACKAGES_FULL) $(USB_3G_DONGLE_PACKAGES) $(PRINTER_PACKAGES) detect_internet

define Device/mt7621a-evb
  BOARDNAME := MT7621A_EVB
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := MediaTek MT7621 EVB
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(SATA_AHCI_STORAGE_BASE) $(WIFI_PACKAGES_2G) $(WIFI_PACKAGES_5G) 
endef
TARGET_DEVICES += mt7621a-evb

define Device/pbr-m1
  BOARDNAME := PBR-M1
  IMAGE_SIZE := $(ralink_default_fw_size_32M)
  DEVICE_TITLE := PandoraBox PBR-M1
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(SATA_AHCI_STORAGE_BASE) $(WIFI_PACKAGES_2G) $(WIFI_PACKAGES_5G) $(RTC_PACKAGES) $(SYNCDIAL_PACKAGES)
endef
TARGET_DEVICES += pbr-m1

define Device/pbr-m2
  BOARDNAME := PBR-M2
  IMAGE_SIZE := $(ralink_default_fw_size_32M)
  DEVICE_TITLE := PandoraBox PBR-M2
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH)  $(WIFI_PACKAGES_2G) $(WIFI_PACKAGES_5G) $(SYNCDIAL_PACKAGES)
endef
TARGET_DEVICES += pbr-m2

define Device/pbr-aps
  BOARDNAME := PBR-APS
  IMAGE_SIZE := $(ralink_default_fw_size_32M)
  DEVICE_TITLE := PandoraBox PBR-APS512
  DEVICE_PACKAGES :=$(PACKAGES_16M_FLASH) $(SATA_AHCI_STORAGE_BASE) $(RTC_PACKAGES)
endef
TARGET_DEVICES += pbr-aps

define Device/a3004ns
  BOARDNAME := A3004NS
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := TOTOLINK A3004NS
  DEVICE_PACKAGES :=$(PACKAGES_16M_FLASH) $(WIFI_PACKAGES_5G) $(SYNCDIAL_PACKAGES)
endef
TARGET_DEVICES += a3004ns

define Device/amazingbox
  BOARDNAME := ABOX
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := AmazingBox Lite
  DEVICE_PACKAGES :=$(PACKAGES_16M_FLASH) $(SATA_AHCI_STORAGE_BASE) $(WIFI_PACKAGES_5G) $(SYNCDIAL_PACKAGES)
endef
TARGET_DEVICES += amazingbox

define Device/timecloud
  BOARDNAME := TIMECLOUD
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := Thunder TimeCloud
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(SATA_AHCI_STORAGE_BASE) 
endef
TARGET_DEVICES += timecloud

define Device/timecloud2
  BOARDNAME := TIMECLOUD2
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := Thunder TimeCloud 2
  DEVICE_PACKAGES := $$(PACKAGES_16M_FLASH) $(SATA_AHCI_STORAGE_BASE) 
endef
TARGET_DEVICES += timecloud2

define Device/newifi-2
  BOARDNAME := NEWIFI-D1
  IMAGE_SIZE := $(ralink_default_fw_size_32M)
  DEVICE_TITLE := Newifi 2
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(WIFI_PACKAGES_2G) $(WIFI_PACKAGES_5G) $(SYNCDIAL_PACKAGES) kmod-ledtrig-lightflow
endef
TARGET_DEVICES += newifi-2

define Device/newifi-3
  BOARDNAME := NEWIFI-D2
  IMAGE_SIZE := $(ralink_default_fw_size_32M)
  DEVICE_TITLE := Newifi 3
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(SATA_AHCI_STORAGE_BASE) $(WIFI_PACKAGES_2G) $(WIFI_PACKAGES_5G) $(SYNCDIAL_PACKAGES)
endef
TARGET_DEVICES += newifi-3

# 
# define Device/creativebox
#   BOARDNAME := CREATIVEBOX
#   IMAGE_SIZE := $(ralink_default_fw_size_32M)
#   DEVICE_TITLE := CreativeBox MT7621 Board
#   DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(SATA_AHCI_STORAGE_BASE) $(WIFI_PACKAGES_2G) $(WIFI_PACKAGES_5G) $(RTC_PACKAGES) $(SYNCDIAL_PACKAGES)
# endef
#TARGET_DEVICES += creativebox

define Device/yk-l2
  BOARDNAME := Youku-L2
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := YouKu L2
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(WIFI_PACKAGES_2G) $(WIFI_PACKAGES_5G) $(SYNCDIAL_PACKAGES)
endef
TARGET_DEVICES += yk-l2
