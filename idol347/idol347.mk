ifndef TARGET_KERNEL_USE
TARGET_KERNEL_USE := mainline
endif

KERNEL_MODS := $(wildcard device/generic/msm8916/shared/prebuilt-kernel/android-$(TARGET_KERNEL_USE)/*.ko)

# Following modules go to vendor partition
VENDOR_KERN_MODS :=
BOARD_VENDOR_KERNEL_MODULES := $(filter $(VENDOR_KERN_MODS),$(KERNEL_MODS))

# All other modules go to ramdisk
BOARD_GENERIC_RAMDISK_KERNEL_MODULES := $(filter-out $(VENDOR_KERN_MODS),$(KERNEL_MODS))

# Inherit the full_base and device configurations
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, device/generic/msm8916/idol347/device.mk)
$(call inherit-product, device/generic/msm8916/shared/device.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Product overrides
PRODUCT_NAME := idol347
PRODUCT_DEVICE := idol347
PRODUCT_BRAND := AOSP
