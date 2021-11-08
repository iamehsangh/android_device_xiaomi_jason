#
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sdm660-common
include device/xiaomi/sdm660-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/jason

# Kernel
TARGET_KERNEL_CONFIG := jason_defconfig
TARGET_KERNEL_SOURCE := kernel/xiaomi/jason
TARGET_KERNEL_VERSION := 4.4

# Camera
BOARD_QTI_CAMERA_32BIT_ONLY := true

# Crypto
TARGET_HW_DISK_ENCRYPTION := true

# Display
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x00002000U
TARGET_SCREEN_DENSITY := 420

# DT2W
TARGET_TAP_TO_WAKE_NODE := "/sys/touchpanel/double_tap"

# Keylayout
TARGET_USES_HARDWARE_KEYS := true

# Mainfest
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest.xml

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5368709120
BOARD_VENDORIMAGE_PARTITION_SIZE := 872415232

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/recovery.fstab

# Releasetools
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_jason
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# SELinux
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/public
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Security patch level
VENDOR_SECURITY_PATCH := 2020-11-23

# Inherit the proprietary files
include vendor/xiaomi/jason/BoardConfigVendor.mk
