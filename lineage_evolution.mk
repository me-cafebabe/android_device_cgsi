CGSI_CUSTOM_ROM_NAME := Evolution-X
CGSI_CUSTOM_ROM_BRANCH := cnb

# GMS
ifneq ($(CGSI_ARCH),arm64)
WITH_GMS ?= false
endif
