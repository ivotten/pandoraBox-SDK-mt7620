DEPS_package/linux/Makefile=modules/*.mk $(TOPDIR)/target/linux/*/modules.mk
$(eval $(call PackageDir,custom-package_shadowsocksr-libev,custom-package/shadowsocksr-libev,))
$(eval $(call PackageDir,linux,linux,))
$(eval $(call PackageDir,toolchain,toolchain,))
