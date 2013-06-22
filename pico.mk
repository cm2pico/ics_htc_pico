# Copyright (C) 2011 The Android Open Source Project
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

# proprietary side of the device
# Inherit from those products. Most specific first

# We havent decided what props we need,yet
# $(call inherit-product-if-exists, vendor/htc/pico/pico-vendor.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Video decoding
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libmm-omxcore \
    libOmxCore \
    libOmxVidEnc 
    
# Graphics 
PRODUCT_PACKAGES += \
    gralloc.msm7x27 \
    copybit.msm7x27 \
    hwcomposer.msm7x27 \
    libtilerenderer \
    libQcomUI
    
# Audio
PRODUCT_PACKAGES += \
    audio.primary.pico \
    audio_policy.pico \
    audio.a2dp.default \
    libaudioutils

# Other
PRODUCT_PACKAGES += \
    dexpreopt \
    lights.pico \
    gps.pico    
    
# Camera
PRODUCT_PACKAGES += \
    camera.msm7x27    
    
# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Other
PRODUCT_PACKAGES += \
    gadget_id \
    bash \
    hwaddrs \    

## Hardware properties 
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/base/data/etc/platform.xml:system/etc/permissions/platform.xml \
    frameworks/base/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml    

# Init
PRODUCT_COPY_FILES += \
    device/htc/pico/files/init.pico.rc:root/init.pico.rc \
    device/htc/pico/files/ueventd.pico.rc:root/ueventd.pico.rc \
    device/htc/pico/files/init.pico.usb.rc:root/init.pico.usb.rc \
    
## Camera
#PRODUCT_COPY_FILES += \
#    device/samsung/trebon/prebuilt/system/lib/hw/camera.trebon.so:system/lib/hw/camera.trebon.so \
#    device/samsung/trebon/prebuilt/system/lib/libcamera.so:system/lib/libcamera.so \
#    device/samsung/trebon/prebuilt/system/lib/lib/system/libcamera_client.so:system/lib/libcamera_client.so \
#    device/samsung/trebon/prebuilt/system/lib/lib/system/libcameraservice.so:system/lib/libcameraservice.so \
#    device/samsung/trebon/prebuilt/system/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
#    device/samsung/trebon/prebuilt/system/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
#    device/samsung/trebon/prebuilt/system/lib/libmmipl.so:system/lib/libmmipl.so \
#    device/samsung/trebon/prebuilt/system/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
#    device/samsung/trebon/prebuilt/system/lib/libmm-omxcore.so:system/lib/libmm-omxcore.so \
#    device/samsung/trebon/prebuilt/system/lib/liboemcamera.so:system/lib/liboemcamera.so    
    
# Set usb type
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mass_storage \
    persist.service.adb.enable=1

DEVICE_PACKAGE_OVERLAYS += device/htc/pico/overlay

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml 
    PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Releasetools
PRODUCT_COPY_FILES += \
     device/htc/pico/releasetools/extras.sh:system/bin/extras.sh

# Vold 
PRODUCT_COPY_FILES += \
    device/htc/pico/files/etc/vold.fstab:system/etc/vold.fstab 

# Prebuilt Binaries
# Don't work on 4.0.4 because from 2.3.5! And we don't need this !

# Prebuilt Modules
PRODUCT_COPY_FILES += \
    device/htc/pico/prebuilt/bcm4330.ko:system/lib/modules/bcm4330.ko \
    device/htc/pico/prebuilt/kineto_gan.ko:system/lib/modules/kineto_gan.ko 
    device/htc/pico/prebuilt/cifs.ko:system/lib/modules/cifs.ko \

# Wifi
PRODUCT_COPY_FILES += \
    device/htc/pico/files/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/htc/pico/files/etc/dhcpd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/htc/pico/prebuilt/etc/firmware/fw_bcm4330.bin:system/etc/firmware/fw_bcm4330.bin \
    device/htc/pico/prebuilt/etc/firmware/fw_bcm4330_apsta.bin:system/etc/firmware/fw_bcm4330_apsta.bin \
    device/htc/pico/prebuilt/etc/firmware/fw_bcm4330b2.bin:system/etc/firmware/fw_bcm4330b2.bin \
    device/htc/pico/prebuilt/etc/firmware/fw_bcm4330b2_apsta.bin:system/etc/firmware/fw_bcm4330b2_apsta.bin \
    
# Audio
# Need all audio filters
PRODUCT_COPY_FILES += \
    device/htc/pico/files/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/htc/pico/files/etc/media_profiles.xml:system/etc/media_profiles.xml \
    vendor/htc/pico/proprietary/lib/libaudioeq.so:system/lib/libaudioeq.so \

# Device permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

# Sensors
# Don't work on 4.0.4 because from 2.3.5! You need to compile it with yourself
    
# GPS
# Don't work on 4.0.4 because from 2.3.5! You need to compile it with yourself

# 3D(ICS Blobs)
PRODUCT_COPY_FILES += \
    device/htc/pico/prebuilt/etc/firmware/a225_pfp.fw:system/etc/firmware/a225_pfp.fw \
    device/htc/pico/prebuilt/etc/firmware/a225_pm4.fw:system/etc/firmware/a225_pm4.fw \
    device/htc/pico/prebuilt/etc/firmware/a300_pfp.fw:system/etc/firmware/a300_pfp.fw \
    device/htc/pico/prebuilt/etc/firmware/a300_pm4.fw:system/etc/firmware/a300_pm4.fw \
    device/htc/pico/prebuilt/etc/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
    device/htc/pico/prebuilt/etc/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw \
    device/htc/pico/prebuilt/etc/firmware/a225p5_pm4.fw:system/etc/firmware/a225p5_pm4.fw \
    device/htc/pico/prebuilt/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/htc/pico/prebuilt/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    device/htc/pico/prebuilt/lib/libC2D2.so:system/lib/libC2D2.so \
    device/htc/pico/prebuilt/lib/libgsl.so:system/lib/libgsl.so \
    device/htc/pico/prebuilt/lib/libOpenVG.so:system/lib/libOpenVG.so \
    device/htc/pico/prebuilt/lib/libsc-a2xx.so:system/lib/libsc-a2xx.so \
    device/htc/pico/prebuilt/lib/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
    device/htc/pico/prebuilt/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    device/htc/pico/prebuilt/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    device/htc/pico/prebuilt/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    device/htc/pico/prebuilt/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so 

# Camera
# Don't work on 4.0.4 because from 2.3.5! An

# RIL
# Don't work on 4.0.4 because from 2.3.5! You need to compile it with yourself

#CHROMATIX
# Don't work on 4.0.4 because from 2.3.5! We don't need this!

# OMX & MISC.
# Don't work on 4.0.4 because from 2.3.5! You need to compile it with yourself
PRODUCT_COPY_FILES += \
    vendor/htc/pico/proprietary/etc/gps.conf:system/etc \
    vendor/htc/pico/proprietary/etc/spn-conf.xml:system/etc 

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/pico/prebuilt/etc/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/pico/prebuilt/etc/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/pico/prebuilt/etc/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg \
    device/htc/pico/prebuilt/etc/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    device/htc/pico/prebuilt/etc/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg \

# Bluetooth
PRODUCT_COPY_FILES += \
    vendor/htc/pico/proprietary/etc/firmware/BCM4330B1_002.001.003.0221.0228.hcd:system/etc/firmware/BCM4330B1_002.001.003.0221.0228.hcd \

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/pico/prebuilt/usr/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/htc/pico/prebuilt/usr/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/htc/pico/prebuilt/usr/keychars/pico-keypad.kcm.bin:system/usr/keychars/pico-keypad.kcm.bin \
    device/htc/pico/prebuilt/usr/keychars/BT_HID.kcm.bin:system/usr/keychars/BT_HID.kcm.bin \
    device/htc/pico/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/pico/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/pico/prebuilt/usr/keylayout/BT_HID.kl:system/usr/keylayout/BT_HID.kl \
    device/htc/pico/prebuilt/usr/keylayout/pico-keypad.kl:system/usr/keylayout/pico-keypad.kl
    device/htc/pico/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \

# Camera 
# Don't work on 4.0.4 because from 2.3.5! Need open source drivers for ics from qualcomm or need hack for 2.3.5 proprietary

PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.camera=pico \
    debug.camcorder.disablemeta=1 \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r6 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    ro.telephony.call_ring.multiple=false \
    ro.vold.umsdirtyratio=20

PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.enable-player=true \
    media.stagefright.enable-meta=false \
    media.stagefright.enable-scan=false \
    media.stagefright.enable-http=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-qcp=true
    
PRODUCT_LOCALES := en_GB
PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
