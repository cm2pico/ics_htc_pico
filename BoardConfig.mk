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
#

TARGET_SPECIFIC_HEADER_PATH := device/htc/pico/include

USE_CAMERA_STUB := true

# Camera
# http://r.cyanogenmod.com/#/c/13317/
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT

# Needs Review
#BOARD_CAMERA_USE_GETBUFFERINFO := true
#BOARD_USE_CAF_LIBCAMERA := true
# This is needed by libcamera.so
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true

# Arch related defines
TARGET_BOARD_PLATFORM := msm7k
# Yes we do,but let's hash it out 
# ARCH_ARM_HAVE_VFP := true
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi

# Target properties
TARGET_BOOTLOADER_BOARD_NAME := pico
TARGET_OTA_ASSERT_DEVICE := pico

# Target information
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
BOARD_NO_RGBX_8888 := true
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true
TARGET_USES_16BPPSURFACE_FOR_OPAQUE := true
TARGET_PROVIDES_INIT_TARGET_RC := true
TARGET_USES_OLD_LIBSENSORS_HAL:=true
TARGET_OTA_ASSERT_DEVICE := pico

#Enable OpenGL Hardware Acceleration
# msm7x27: no support for overlay, bypass, or c2d
USE_OPENGL_RENDERER := true
TARGET_USE_OVERLAY := false
TARGET_HAVE_BYPASS := false
TARGET_USES_C2D_COMPOSITION := false
TARGET_USES_GENLOCK := true
BOARD_KERNEL_NEW_PPPOX := true
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true
BOARD_USE_SKIA_LCDTEXT := true
BOARD_EGL_CFG := device/htc/pico/configs/egl.cfg

# Audio & Bluetooth
TARGET_PROVIDES_LIBAUDIO := true
BOARD_COMBO_DEVICE_SUPPORTED := true
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
TARGET_USES_OLD_LIBSENSORS_HAL:=true

# QCOM
#BOARD_USES_QCOM_HARDWARE := true
#BOARD_USES_QCOM_LIBS := true
#BOARD_USES_QCOM_LIBRPC := true
BOARD_USE_ADRENO_200_GPU := true

# GPS
BOARD_GPS_LIBRARIES := libgps #librpc
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := pico
BOARD_VENDOR_QCOM_AMSS_VERSION := 6225
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Browser
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
HTTP := chrome

# USB mass storage(Needs Review)
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file
BOARD_UMS_LUNFILE := /sys/class/android_usb/android0/f_mass_storage/lun/file

# ICS Stuff 
BOARD_HAS_NO_SELECT_BUTTON := true

# RIL
BOARD_USE_NEW_LIBRIL_HTC := true

#COMMON_GLOBAL_CFLAGS += -DUSE_htc_ALS_DUMMY

# Skia
BOARD_USE_SKIA_LCDTEXT := true
BOARD_FORCE_DITHERING := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := bcm4330
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4330.ko"
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/firmware/fw_bcm4330b2.bin"
WIFI_DRIVER_FW_AP_PATH      := "/system/etc/firmware/fw_bcm4330b2_a1psta.bin"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/firmware/fw_bcm4330b2.bin nvram_path=/proc/calibration"
WIFI_DRIVER_MODULE_NAME     := "bcm4330"
WIFI_DRIVER_HAS_HTC_SOFTAP  := true

# FM Radio
# BOARD_FM_DEVICE := bcm4329
# BOARD_HAVE_FM_RADIO := true
# BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

TARGET_RELEASETOOLS_EXTENSIONS := device/htc/pico/releasetools
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60

TARGET_PREBUILT_KERNEL := device/htc/pico/prebuilt/kernel

# Kernel
BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null
BOARD_KERNEL_BASE := 0x12c00000
BOARD_PAGE_SIZE := 0x00000800

# Touch screen compatibility for ICS
BOARD_USE_LEGACY_TOUCHSCREEN := true

# Fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00400000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0eb40000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x09600000
BOARD_FLASH_BLOCK_SIZE := 262144

# OTA script
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/htc/pico/releasetools/ota_from_target_files
