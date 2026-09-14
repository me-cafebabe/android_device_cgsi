CGSI_CUSTOM_ROM_NAME := Evolution-X
CGSI_CUSTOM_ROM_BRANCH := cnb

# FaceUnlock
ifneq ($(CGSI_ARCH),arm64)
TARGET_DISABLE_FACEUNLOCK := true
endif

# GMS
ifneq ($(CGSI_ARCH),arm64)
WITH_GMS ?= false
endif
