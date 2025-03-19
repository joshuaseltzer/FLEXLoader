export TARGET=:clang:latest:5.1
export ARCHS=armv7 armv7s arm64

PACKAGE_VERSION=$(THEOS_PACKAGE_BASE_VERSION)

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SSFLEXLoader
SSFLEXLoader_FILES = SSFLEXLoaderLoader.xm
SSFLEXLoader_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
