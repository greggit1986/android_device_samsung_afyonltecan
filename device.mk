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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/samsung/afyonltecan/afyonltecan-vendor.mk)

# BPF
PRODUCT_PRODUCT_PROPERTIES += \
    ro.kernel.ebpf.supported=false

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# NFC
# $(call inherit-product, device/samsung/afyonlte-common/nfc/pn547/product.mk)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# RIL - https://github.com/LineageOS/android_device_motorola_msm8937-common/commit/4b75cf472fcb83bbcf7f0a2315994c25cc466fe8
PRODUCT_PACKAGES += \
    libcnefeatureconfig \
    librmnetctl \
    libxml2

#https://github.com/acroreiser/android_device_lge_hammerhead/blob/lineage-18.1/device.mk
PRODUCT_PROPERTY_OVERRIDES += \
    DEVICE_PROVISIONED=1 \
    ro.telephony.iwlan_operation_mode=legacy

# Do not power down SIM card when modem is sent to Low Power Mode.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.apm_sim_not_pwdn=1

# LTE, CDMA, GSM/WCDMA
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.force_eri_from_xml=true \
    persist.radio.mode_pref_nv10=1

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.radio.use_cc_names=true

# If data_no_toggle is 1 then active and dormancy enable at all times.
# If data_no_toggle is 0 there are no reports if the screen is off.
# Leaving this property unset defaults to '0'
# Due to RIL changes, setting this to 1 now enables toggling of limited
# system indications and does not impact data state changes.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.data_no_toggle=1
# Setup custom emergency number list based on the MCC. This is needed by RIL
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.custom_ecc=1

# Request modem to send PLMN name always irrespective
# of display condition in EFSPN.
# RIL uses this property.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.always_send_plmn=true

# common afyonlte
$(call inherit-product, device/samsung/afyonlte-common/afyonlte.mk)
