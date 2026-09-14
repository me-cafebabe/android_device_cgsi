#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

CGSI_CUSTOM_ROM_NAME := LineageOS
CGSI_CUSTOM_ROM_BRANCH := 24.0

# Import cgsi product variables
include device/cgsi/import_product_vars.mk

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
ifeq ($(CGSI_DEVICE_TYPE),phone)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
else
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
endif

# Inherit from the device configuration.
$(call inherit-product, device/cgsi/device.mk)

# Evolution-X
ifneq ($(wildcard vendor/lineage/config/evolution.mk),)
include device/cgsi/lineage_evolution.mk
endif

# Inherit some common Lineage stuff.
ifeq ($(CGSI_DEVICE_TYPE),phone)
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)
else
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)
endif

# Product properties
include device/cgsi/common_product_properties.mk
