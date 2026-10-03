#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/lge/caymanlm

DEVICE_NAME := caymanlm

# Inherit from the common device configuration.
$(call inherit-product, device/lge/sm7250-common/sm7250-common.mk)

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Fingerprint
$(call soong_config_set,lge_udfps,sensor_x,540)
$(call soong_config_set,lge_udfps,sensor_y,2187)
$(call soong_config_set,lge_udfps,sensor_radius,91)
$(call soong_config_set_bool,lge_udfps,managed_sequence,true)

$(call inherit-product, hardware/lge/aidl/biometrics/fingerprint/udfps.mk)

# Sensors
PRODUCT_PACKAGES += \
    sensors.lge

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Overlays
PRODUCT_PACKAGES += \
    ApertureOverlayCaymanlm \
    FrameworksResOverlayCaymanlm \
    SettingsOverlayCaymanlm \
    SystemUIOverlayCaymanlm

# Soong namespace
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.lge

# Inherit from vendor makefiles.
$(call inherit-product, vendor/lge/caymanlm/caymanlm-vendor.mk)
