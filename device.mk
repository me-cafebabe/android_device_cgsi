#
# Copyright (C) 2019 The Android Open-Source Project
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

DEVICE_PATH := device/cgsi
-include $(DEVICE_PATH)/custom_build_id.mk
$(call soong_config_set_bool,cgsi,enabled,true)

# Audio - utilities
PRODUCT_PACKAGES_DEBUG += \
    tinycap2 \
    tinymix2 \
    tinypcminfo2 \
    tinyplay2

# HIDL
# Add all system_ext packages used to support older/upgrading devices that have
# PRODUCT_SHIPPING_API_LEVEL 34 or older.
# These can be removed as we drop support for the older API levels.
PRODUCT_PACKAGES += \
    android.hidl.allocator@1.0-service \
    android.hidl.memory@1.0-impl \
    hwservicemanager

# Init
PRODUCT_PACKAGES += \
    gsi_skip_mount.cfg \
    init.gsi.rc

ifneq ($(wildcard device/mainline/common/libraries/libinit/Android.bp),)
$(call soong_config_set,libinit,vendor_init_lib,//device/mainline/common:init_mainline_common)
endif

# Native bridge
ifeq ($(CGSI_ARCH),x86_64)
$(call inherit-product-if-exists, device/x86_64-extras/ndk_translation/ndk_translation.mk)
endif

# Page size
PRODUCT_MAX_PAGE_SIZE_SUPPORTED := 16384
PRODUCT_NO_BIONIC_PAGE_SIZE_MACRO := true

# Partitions
PRODUCT_BUILD_BOOT_IMAGE := false
PRODUCT_BUILD_CACHE_IMAGE := false
PRODUCT_BUILD_DEBUG_BOOT_IMAGE := false
PRODUCT_BUILD_DEBUG_VENDOR_BOOT_IMAGE := false
PRODUCT_BUILD_RAMDISK_IMAGE := false
PRODUCT_BUILD_RECOVERY_IMAGE := false
PRODUCT_BUILD_SYSTEM_DLKM_IMAGE := false
PRODUCT_BUILD_SUPER_EMPTY_IMAGE := false
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_BUILD_USERDATA_IMAGE := false
PRODUCT_BUILD_VENDOR_IMAGE := false
PRODUCT_USE_DYNAMIC_PARTITION_SIZE := true

# Platform
TARGET_BOARD_PLATFORM := generic

# Properties
# Additional settings used in all GSI builds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.crypto.metadata_init_delete_all_keys.enabled=false \
    debug.codec2.bqpool_dealloc_after_stop=1

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := $(PLATFORM_SDK_VERSION)

# UFFD GC
PRODUCT_ENABLE_UFFD_GC := true

# VNDK
PRODUCT_EXTRA_VNDK_VERSIONS := \
    31 \
    32 \
    33 \
    34

# Wi-Fi
# PRODUCT_SHIPPING_API_LEVEL 33 or older.
# These can be removed as we drop support for the older API levels.
PRODUCT_PACKAGES += \
    wificond
