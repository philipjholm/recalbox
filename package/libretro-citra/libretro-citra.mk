################################################################################
#
# CITRA
#
################################################################################

LIBRETRO_CITRA_VERSION = canary-82
LIBRETRO_CITRA_SITE = git://github.com/libretro/citra.git
LIBRETRO_CITRA_LICENSE = GPLv2+
LIBRETRO_CITRA_GIT_SUBMODULES=y
LIBRETRO_CITRA_DEPENDENCIES = sdl2 fmt boost

LIBRETRO_CITRA_CONF_OPTS=-DENABLE_LIBRETRO=1 \
						-DENABLE_SDL2=1 \
						-DENABLE_QT=0 \
						-DDENABLE_WEB_SERVICE=0 \
						-DCMAKE_BUILD_TYPE=Release \
						-DTHREADS_PTHREAD_ARG=OFF \
						-DCMAKE_VERBOSE_MAKEFILE=1

LIBRETRO_CITRA_CONF_ENV=LDFLAGS=-lpthread

LIBRETRO_CITRA_SUPPORTS_IN_SOURCE_BUILD = NO

define LIBRETRO_CITRA_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/buildroot-build/src/citra_libretro/citra_canary_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/citra_canary_libretro.so
	cp -pr $(@D)/buildroot-build/externals/inih/*.so $(TARGET_DIR)/usr/lib
	cp -pr $(@D)/buildroot-build/externals/libressl/tls/*.so $(TARGET_DIR)/usr/lib
	cp -pr $(@D)/buildroot-build/externals/libressl/ssl/*.so $(TARGET_DIR)/usr/lib
	cp -pr $(@D)/buildroot-build/externals/lurlparser/*.so $(TARGET_DIR)/usr/lib
	cp -pr $(@D)/buildroot-build/externals/fmt/*.so $(TARGET_DIR)/usr/lib
endef

$(eval $(cmake-package))
