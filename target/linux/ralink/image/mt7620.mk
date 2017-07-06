#
# MT7620 Profiles
#

USB_SD_STORAGE_BASE_PACKAGES := kmod-mt762x-mmc kmod-usb-core kmod-usb2 kmod-usb-ohci kmod-usb-storage kmod-usb-storage-extras kmod-scsi-core kmod-scsi-cdrom \
		kmod-ledtrig-usbport
		
SATA_AHCI_STORAGE_BASE := kmod-ata-core kmod-ata-ahci 

PRINTER_PACKAGES :=luci-app-usb-printer luci-i18n-usb-printer-zh-cn kmod-usb-printer p910nd 

WEB_PACKAGES_LAFITE := lafite-config_ray

WEB_PACKAGES_LUCI_BASE := luci luci-mod-admin-full luci-i18n-base-zh-cn luci-proto-ppp luci-theme-material luci-theme-bootstrap \
luci-app-bandwidth luci-i18n-bandwidth-zh-cn luci-app-firewall luci-i18n-firewall-zh-cn \
luci-app-ddns luci-i18n-ddns-zh-cn luci-app-hwacc luci-i18n-hwacc-zh-cn \
luci-app-upnp luci-i18n-upnp-zh-cn luci-app-arpbind luci-i18n-arpbind-zh-cn 

WIFI_PACKAGES_2G := kmod-rt2860v2
WIFI_PACKAGES_5G := kmod-mt76x2e

STORAGE_UTILS_PACKAGES_FULL := $(USB_SD_STORAGE_BASE_PACKAGES) kmod-nls-cp437 kmod-nls-cp936 kmod-nls-iso8859-1 kmod-nls-utf8 \
			kmod-fs-ufsd kmod-fs-vfat kmod-fs-ext4 kmod-fs-exfat \
			fdisk hdparm ufsd-tools mkdosfs dosfsck exfat-utils libext2fs e2fsprogs cfdisk parted \
			vsftpd samba3-pandorabox pbmsa-utils \
			luci-app-samba luci-i18n-samba-zh-cn luci-app-vsftpd luci-i18n-vsftpd-zh-cn \
			luci-proto-relay
			
STORAGE_UTILS_PACKAGES_LITE := $(USB_SD_STORAGE_BASE_PACKAGES) kmod-nls-cp437 kmod-nls-cp936 kmod-nls-iso8859-1 kmod-nls-utf8 \
			kmod-fs-ufsd kmod-fs-vfat kmod-fs-ext4 kmod-fs-exfat \
			samba3-pandorabox pbmsa-utils \
			luci-app-samba luci-i18n-samba-zh-cn
			
USB_3G_DONGLE_PACKAGES := luci-proto-3g comgt kmod-usb-net  kmod-usb-net-rndis kmod-usb-net-sierrawireless kmod-usb-net-qmi-wwan \
		kmod-usb-serial kmod-usb-serial-option kmod-usb-serial-wwan chat


PACKAGES_8M_FLASH_NOUSB := detect_internet

PACKAGES_8M_FLASH_USB := $(STORAGE_UTILS_PACKAGES_LITE) $(WEB_PACKAGES_LUCI_BASE) detect_internet

PACKAGES_16M_FLASH := $(STORAGE_UTILS_PACKAGES_FULL) $(WEB_PACKAGES_LUCI_BASE) $(USB_3G_DONGLE_PACKAGES) $(PRINTER_PACKAGES) detect_internet

define Device/mt7620a-evb
  BOARDNAME := MT7620A_EVB
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := MediaTek MT7620a Evaluation Board
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(WIFI_PACKAGES_2G) $(WIFI_PACKAGES_5G) 
endef
TARGET_DEVICES += mt7620a-evb

define Device/mw305r
  BOARDNAME := MW305R
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := Mercury MW305R
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(WIFI_PACKAGES_2G)
endef
TARGET_DEVICES += mw305r

define Device/wr8305rt
  BOARDNAME := WR8305RT
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := ZBT WR8305RT
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(WIFI_PACKAGES_2G)
endef
TARGET_DEVICES += wr8305rt

define Device/wrtnode1
  BOARDNAME := WRTNODE
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := WRTnode 1
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(WIFI_PACKAGES_2G)
endef
TARGET_DEVICES += wrtnode1

define Device/microwrt
  BOARDNAME := MICROWRT
  IMAGE_SIZE := 16515072
  DEVICE_TITLE := Microduino MicroWRT
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(WIFI_PACKAGES_2G)
endef
TARGET_DEVICES += microwrt

define Device/q7
  BOARDNAME := Q7
  IMAGE_SIZE := $(ralink_default_fw_size_8M)
  DEVICE_TITLE := ZTE Q7
  DEVICE_PACKAGES := $(PACKAGES_8M_FLASH_USB) $(WIFI_PACKAGES_2G)
endef
TARGET_DEVICES += q7

define Device/phicomm-k1
  BOARDNAME := K1
  IMAGE_SIZE := $(ralink_default_fw_size_8M)
  DEVICE_TITLE := Phicomm K1
  DEVICE_PACKAGES := $(PACKAGES_8M_FLASH_NOUSB) $(WIFI_PACKAGES_2G) $(WIFI_PACKAGES_5G)
endef
TARGET_DEVICES += phicomm-k1

define Device/phicomm-k2
  BOARDNAME := K2
  IMAGE_SIZE := $(ralink_default_fw_size_8M)
  DEVICE_TITLE := Phicomm K2
  DEVICE_PACKAGES := $(PACKAGES_8M_FLASH_NOUSB) $(WIFI_PACKAGES_2G) $(WIFI_PACKAGES_5G)
endef
TARGET_DEVICES += phicomm-k2

define Device/newifi-mini
  BOARDNAME := NEWIFI-Y1
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := Newifi mini
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(WIFI_PACKAGES_2G) $(WIFI_PACKAGES_5G)
endef
TARGET_DEVICES += newifi-mini

define Device/newifi-y1s
  BOARDNAME := NEWIFI-Y1S
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := Newifi Y1S
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(WIFI_PACKAGES_2G) $(WIFI_PACKAGES_5G) kmod-i2c-core kmod-ralink-i2c kmod-leds-tca6507 kmod-ledtrig-breath
endef
TARGET_DEVICES += newifi-y1s

define Device/ap7620a
  BOARDNAME := AP7620A
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := AP7620A
  DEVICE_PACKAGES := $$(PACKAGES_16M_FLASH) $(WIFI_PACKAGES_2G) $(WIFI_PACKAGES_5G)
endef
TARGET_DEVICES += ap7620a

define Device/yk-l1
  BOARDNAME := YK1
  IMAGE_SIZE := $(ralink_default_fw_size_32M)
  DEVICE_TITLE := YouKu_YK-L1
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(WIFI_PACKAGES_2G)
endef
TARGET_DEVICES += yk-l1

define Device/ry-1
  BOARDNAME := RY-1
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := xCloud RY-1
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(WIFI_PACKAGES_2G)
endef
TARGET_DEVICES += ry-1

define Device/br100
  BOARDNAME := BR100
  IMAGE_SIZE := 8126464
  DEVICE_TITLE := Aigale Ai-BR100
  DEVICE_PACKAGES := $(PACKAGES_8M_FLASH_USB) $(WIFI_PACKAGES_2G)
endef
TARGET_DEVICES += br100

define Device/xiaomi-mini
  BOARDNAME := XIAOMI_MINI
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := Xiaomi Mini
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(WIFI_PACKAGES_2G) $(WIFI_PACKAGES_5G)
endef
TARGET_DEVICES += xiaomi-mini

define Device/hc5661
  BOARDNAME := HC5661
  IMAGE_SIZE := 16252928
  DEVICE_TITLE := HiWiFi HC5661
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(SATA_AHCI_STORAGE_BASE) $(WIFI_PACKAGES_2G) $(WIFI_PACKAGES_5G)
endef
TARGET_DEVICES += hc5661

define Device/hc5761
  BOARDNAME := HC5761
  IMAGE_SIZE := 16252928
  DEVICE_TITLE := HiWiFi HC5761
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(WIFI_PACKAGES_2G) kmod-mt7610e
endef
TARGET_DEVICES += hc5761

define Device/hc5861
  BOARDNAME := HC5861
  IMAGE_SIZE := 16252928
  DEVICE_TITLE := HiWiFi HC5861
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(WIFI_PACKAGES_2G) $(WIFI_PACKAGES_5G) $(WEB_PACKAGES_LUCI_BASE)
endef
TARGET_DEVICES += hc5861

define Device/oye-0001
  BOARDNAME := OYE-0001
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := OYE-0001
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(WIFI_PACKAGES_2G) $(WEB_PACKAGES_LUCI_BASE)
endef
TARGET_DEVICES += oye-0001

define Device/mtall
  BOARDNAME := MTALL
  IMAGE_SIZE := $(ralink_default_fw_size_16M)
  DEVICE_TITLE := MTALL
  DEVICE_PACKAGES := $(PACKAGES_16M_FLASH) $(WIFI_PACKAGES_2G)
endef
TARGET_DEVICES += mtall


