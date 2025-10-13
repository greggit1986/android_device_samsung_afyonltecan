# Copyright (C) 2014-2016 The CyanogenMod Project
# Copyright (C) 2017-2021 The LineageOS Project
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

DEVICE_PATH := device/samsung/afyonltecan
COMMON_PATH := device/samsung/msm8226-common

# inherit from common msm8226-common
include device/samsung/msm8226-common/BoardConfigCommon.mk

# Bluetooth-TODO
#BOARD_CUSTOM_BT_CONFIG := $(COMMON_PATH)/bluetooth/vnd_afyonlte.txt

# Build Fingerprint
BUILD_FINGERPRINT := samsung/afyonltevl/afyonltecan:4.4.2/KOT49H/G386WVLS1AQB1:user/release-keys

# Enable SVELTE memory configuration
MALLOC_SVELTE := true

# Kernel
TARGET_KERNEL_CONFIG := lineage_afyonltecan_defconfig

# OTA
TARGET_OTA_ASSERT_DEVICE := afyonltecan,afyonltetmo,afyonlteMetroPCS,afyonltemtr,SM-G386T,SM-G386T1,SM-G386W,G386T,G386T1

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Include
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include
TARGET_SPECIFIC_HEADER_PATH := $(COMMON_PATH)/include

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_afyonlte

TARGET_PROCESS_SDK_VERSION_OVERRIDE += \
    /system/vendor/bin/hw/android.hardware.sensors@1.0-service.samsung8226=22 \
    /system/vendor/bin/hw/rild=27

# Init-recovery-bringup
#TARGET_RECOVERY_DEVICE_MODULES := libinit_afyonlte

# NFC
#BOARD_NFC_HAL_SUFFIX := msm8226

# Radio
#BOARD_PROVIDES_LIBRIL := true

#TARGET_LD_SHIM_LIBS += \
#    /vendor/lib/libsec-ril.so|libcutils_shim.so

# NFC
#include $(COMMON_PATH)/nfc/pn547/board.mk

# Radio/RIL
#include $(COMMON_PATH)/radio/single/board.mk

# inherit from the proprietary version
include vendor/samsung/afyonltecan/BoardConfigVendor.mk
