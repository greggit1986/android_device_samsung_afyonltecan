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

# inherit from common afyonlte
include device/samsung/afyonlte-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/afyonltecan

# Shims
#TARGET_LD_SHIM_LIBS += \
#        /system/vendor/lib/libmmcamera_imx175.so|libshim_imx175.so

# Kernel
####### For Recovery
TARGET_KERNEL_RECOVERY_CONFIG := lineage_afyonltecan-recovery_defconfig
####### For Normal build
TARGET_KERNEL_CONFIG := lineage_afyonltecan_defconfig

# Fingerprint
BUILD_FINGERPRINT := samsung/afyonltevl/afyonltecan:4.4.2/KOT49H/G386WVLS1AQA1:user/release-keys

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_afyonlte

# NFC
# include $(COMMON_PATH)/nfc/pn547/board.mk

# Radio/RIL
include $(COMMON_PATH)/radio/single/board.mk

# SELinux
include device/samsung/afyonltecan/sepolicy_afyon/sepolicy.mk

# inherit from the proprietary version
include vendor/samsung/afyonltecan/BoardConfigVendor.mk
