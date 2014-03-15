# Include common makefile
$(call inherit-product, device/samsung/u8500-common/common.mk)

# For better compatibility with ROMs (like Slim, PAC)
$(call inherit-product, vendor/samsung/u8500-common/codina/codina-vendor-blobs.mk)

ifneq ($(TARGET_SCREEN_HEIGHT),800)
# Call cm.mk because somehow it's not being called!
$(call inherit-product, device/samsung/codina/cm.mk)
endif

LOCAL_PATH := device/samsung/codina

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Ace 2 settings
PRODUCT_PACKAGES += \
    GalaxyAce2Settings

# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.samsungcodina:root/fstab.samsungcodina \
    $(LOCAL_PATH)/rootdir/init.recovery.samsungcodina.rc:root/init.recovery.samsungcodina.rc \
    $(LOCAL_PATH)/rootdir/init.samsungcodina.rc:root/init.samsungcodina.rc \
    $(LOCAL_PATH)/rootdir/init.samsungcodina.usb.rc:root/init.samsungcodina.usb.rc \
    $(LOCAL_PATH)/rootdir/ueventd.samsungcodina.rc:root/ueventd.samsungcodina.rc
    
# STE
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/ste_modem.sh:system/etc/ste_modem.sh

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/adm.sqlite-u8500:system/etc/adm.sqlite-u8500

# Gps
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf

# Storage switch script
 PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/configs/SwapStorages.sh:system/xbin/SwapStorages.sh
 PRODUCT_PROPERTY_OVERRIDES += \
     persist.sys.vold.switchablepair=sdcard0,sdcard1 \
     persist.sys.vold.switchexternal=0