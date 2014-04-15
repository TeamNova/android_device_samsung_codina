# Specify phone tech before including full_phone
$(call inherit-product, vendor/mahdi/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := GT-I8160

# Inherit common product files.
$(call inherit-product, vendor/mahdi/configs/common.mk)
$(call inherit-product, vendor/mahdi/configs/common_full_phone.mk)

# Copy device specific prebuilt files.
PRODUCT_COPY_FILES += \
    vendor/mahdi/prebuilt/bootanimations/BOOTANIMATION-800x480.zip:system/media/bootanimation.zip


# Inherit device configuration
$(call inherit-product, device/samsung/codina/full_codina.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := codina
PRODUCT_NAME := mahdi_codina
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-I8160
PRODUCT_MANUFACTURER := samsung

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-I8160 TARGET_DEVICE=GT-I8160
