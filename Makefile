ARCHS = arm64 arm64e
TARGET = iphone:clang:14.5:14.0
THEOS_PACKAGE_SCHEME = rootless

TWEAK_NAME = VCNextCrack
VCNextCrack_FILES = tweak.x
VCNextCrack_CFLAGS = -fobjc-arc

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
