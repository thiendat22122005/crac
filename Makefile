ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:14.0
THEOS_PACKAGE_SCHEME = rootless

TWEAK_NAME = VCNextCrack
VCNextCrack_FILES = tweak.x
VCNextCrack_CFLAGS = -fobjc-arc

include $(THEOS)/makefiles/common.make
include $(THEOS_MAKE_PATH)/tweak.make
