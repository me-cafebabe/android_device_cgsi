_cgsi_archs := arm64 x86_64
_cgsi_device_types := phone tablet

_cgsi_custom_roms := aospa

$(foreach custom_rom,$(_cgsi_custom_roms),\
    $(foreach arch,$(_cgsi_archs),\
        $(foreach device_type,$(_cgsi_device_types),\
            $(eval _product_device := cgsi_$(arch)_$(device_type))\
            $(eval _target_product := $(custom_rom)_$(_product_device))\
            $(eval PRODUCT_MAKEFILES += $(_target_product):device/cgsi/$(custom_rom).mk)\
            $(eval CGSI.$(_target_product).ARCH := $(arch))\
            $(eval CGSI.$(_target_product).CUSTOM_ROM := $(custom_rom))\
            $(eval CGSI.$(_target_product).DEVICE_TYPE := $(device_type))\
            $(eval CGSI.$(_target_product).PRODUCT_DEVICE := $(_product_device))\
            )))
