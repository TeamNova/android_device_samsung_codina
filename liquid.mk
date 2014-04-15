#
# Copyright (C) 2012 The CyanogenMod Project
# Copyright (C) 2012 The LiquidSmooth Project
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

# name
PRODUCT_RELEASE_NAME := codina

# device
$(call inherit-product-if-exists, device/samsung/codina/full_codina.mk)

# phone
$(call inherit-product, vendor/liquid/config/common_phone.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# If the boot animation is not automatically selected, we chose it here :)

PRODUCT_COPY_FILES +=  \
    vendor/liquid/prebuilt/common/bootanimation/480.zip:system/media/bootanimation.zip

# products
PRODUCT_DEVICE := codina
PRODUCT_BRAND := Samsung
PRODUCT_NAME := liquid_codina
PRODUCT_MODEL := GT-I8160
PRODUCT_MANUFACTURER := Samsung

# overrides
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-I8160 TARGET_DEVICE=GT-I8160
