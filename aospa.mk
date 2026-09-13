#
# SPDX-FileCopyrightText: Paranoid Android
# SPDX-License-Identifier: Apache-2.0
#

CGSI_CUSTOM_ROM_NAME := AOSPA
CGSI_CUSTOM_ROM_BRANCH := calcite

# Import cgsi product variables
include device/cgsi/import_product_vars.mk

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
ifeq ($(CGSI_DEVICE_TYPE),phone)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
else
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
endif

# Inherit from the device configuration.
$(call inherit-product, device/cgsi/device.mk)

# Inherit from the AOSPA configuration.
ifneq ($(CGSI_DEVICE_TYPE),phone)
TARGET_NO_TELEPHONY := true
endif
$(call inherit-product, vendor/aospa/target/product/aospa-target.mk)

# Boot animation resolution.
TARGET_BOOT_ANIMATION_RES := 720

# Product properties
include device/cgsi/common_product_properties.mk
