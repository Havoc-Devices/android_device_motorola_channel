#
# Copyright (C) 2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from motorola sdm632-common
-include device/motorola/sdm632-common/BoardConfigCommon.mk

DEVICE_PATH := device/motorola/channel

# Assertions
TARGET_BOARD_INFO_FILE := device/motorola/channel/board-info.txt
TARGET_OTA_ASSERT_DEVICE := channel

# Init
SOONG_CONFIG_NAMESPACES += MOTOROLA_SDM632_INIT
SOONG_CONFIG_MOTOROLA_SDM632_INIT := DEVICE_LIB
SOONG_CONFIG_MOTOROLA_SDM632_INIT_DEVICE_LIB := //$(DEVICE_PATH):libinit_channel

# Display
TARGET_SCREEN_DENSITY := 320

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Kernel
TARGET_KERNEL_CONFIG := channel_defconfig
BOARD_RAMDISK_USE_XZ := true

# Low Memory Devices
MALLOC_SVELTE := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432        #    32768 * 1024 mmcblk0p41-42
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2885681152    #  2818048 * 1024 mmcblk0p62-63
BOARD_SYSTEM_EXTIMAGE_PARTITION_SIZE := 285212672 #   278528 * 1024 mmcblk0p58-59 (OEM)
BOARD_VENDORIMAGE_PARTITION_SIZE := 603979776     #   589824 * 1024 mmcblk0p60-61

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Sepolicy
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# System props
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# inherit from the proprietary version
include vendor/motorola/channel/BoardConfigVendor.mk
