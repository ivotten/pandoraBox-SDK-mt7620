
include $(TOPDIR)/rules.mk

PKG_NAME:=fcgiwrap
PKG_VERSION:=1.10
PKG_RELEASE:=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/xiaohaidao007/fcgiwrap.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=99c942c90063c73734e56bacaa65f947772d9186
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/fcgiwrap 
  SECTION:=net
  CATEGORY:=Network
  TITLE:=a web based terminal emulator
  URL:=(extra Nginx)Simple FastCGI wrapper for CGI scripts.
  DEPENDS:=+spawn-fcgi +fcgi
endef

define Package/fcgiwrap/description
	Simple FastCGI wrapper for CGI scripts.
	extension Nginx support CGI(use spwan-cgi)
endef

#CONFIGURE_ARGS += --disable-utmp

define Package/fcgiwrap/install
	$(INSTALL_DIR) $(1)/usr/sbin $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/fcgiwrap $(1)/usr/sbin
	$(INSTALL_BIN) ./files/fcgiwrap.init $(1)/etc/init.d/fcgiwrap
endef

$(eval $(call BuildPackage,fcgiwrap))
