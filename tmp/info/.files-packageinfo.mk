DEPS_package/linux/Makefile=modules/*.mk $(TOPDIR)/target/linux/*/modules.mk
$(eval $(call PackageDir,custom-package_shadowsocksr-libev,custom-package/shadowsocksr-libev,))
$(eval $(call PackageDir,linux,linux,))
$(eval $(call PackageDir,toolchain,toolchain,))
$(eval $(call PackageDir,feeds_base_mbedtls,feeds/base/mbedtls,))
$(eval $(call PackageDir,feeds_base_openssl,feeds/base/openssl,))
$(eval $(call PackageDir,feeds_base_zlib,feeds/base/zlib,))
$(eval $(call PackageDir,feeds_packages_pcre,feeds/packages/pcre,))
