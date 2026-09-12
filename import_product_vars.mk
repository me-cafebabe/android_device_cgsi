_vars := ARCH CUSTOM_ROM DEVICE_TYPE PRODUCT_DEVICE

$(foreach var,$(_vars),\
    $(eval CGSI_$(var) := $(CGSI.$(TARGET_PRODUCT).$(var))))
