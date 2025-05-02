#
# Copyright (C) 2014 The CyanogenMod Project
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
#

COMMON_PATH := device/samsung/msm8226-common

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Soong
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
PRODUCT_ENFORCE_RRO_TARGETS := *

# Keylayouts
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(COMMON_PATH)/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl

# NFC
# $(call inherit-product, device/samsung/afyonlte-common/nfc/pn547/product.mk)

# Shims
PRODUCT_PACKAGES += \
    libcutils_shim

# common msm8226
$(call inherit-product, device/samsung/msm8226-common/common.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/samsung/afyonltecan/afyonltecan-vendor.mk)
