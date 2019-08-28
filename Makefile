THEOS_DEVICE_IP = 192.168.1.237
Debug=0
include $(THEOS)/makefiles/common.mk

SYSROOT = $(THEOS)/sdks/iPhoneOS10.3.sdk

PACKAGE_VERSION=1.5.1
TWEAK_NAME = VolFlash
VolFlash_FILES = Tweak.xm
VolFlash_EXTRA_FRAMEWORKS += Cephei
VolFlash_FRAMEWORKS = IOKit

VolFlash_ARCHS = arm64 arm64e
export ARCHS = arm64 arm64e

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"

SUBPROJECTS += volflash
include $(THEOS_MAKE_PATH)/aggregate.mk
