# Copyright (C) 2014 The CyanogenMod Project
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

BOARD_VENDOR := sony

BUILD_BROKEN_DUP_RULES := true

# Use Snapdragon LLVM Compiler if available
TARGET_USE_SDCLANG := true

# Include path
TARGET_SPECIFIC_HEADER_PATH += device/sony/msm8974-common/include

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Kernel properties
ifeq (,$(filter $(TARGET_KERNEL_SOURCE),))
  TARGET_KERNEL_SOURCE := kernel/sony/msm8974
endif

# use CAF variants
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true
TARGET_QCOM_MEDIA_VARIANT := caf-msm8974

# Platform
TARGET_BOOTLOADER_BOARD_NAME := MSM8974
TARGET_BOARD_PLATFORM := msm8974

# Architecture
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := krait
TARGET_CUSTOM_DTBTOOL := dtbToolLineage

# Defines for HW subsystems
-include $(PLATFORM_PATH)/hardware/*/BoardConfig.mk

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_DISABLED_USBAUDIO := true
AUDIO_FEATURE_ENABLED_EXTN_POST_PROC := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

# Camera
TARGET_PROVIDES_CAMERA_HAL := true
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_USES_MEDIA_EXTENSIONS := true
TARGET_NEEDS_LEGACY_CAMERA_HAL1_DYN_NATIVE_HANDLE := true
TARGET_DISABLE_KILLING_ONESHOT_SERVICE := true
TARGET_PROCESS_SDK_VERSION_OVERRIDE := \
    /system/bin/mediaserver=22

# Charger
HEALTHD_ENABLE_TRICOLOR_LED := true
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BACKLIGHT_PATH :=/sys/class/leds/lcd-backlight/brightness
RED_LED_PATH := /sys/class/leds/led:rgb_red/brightness
GREEN_LED_PATH := /sys/class/leds/led:rgb_green/brightness
BLUE_LED_PATH := /sys/class/leds/led:rgb_blue/brightness

# Font
EXTENDED_FONT_FOOTPRINT := true

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
      WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true
    endif
  endif
endif

# exFAT
TARGET_EXFAT_DRIVER := exfat

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true
TARGET_NO_RPC := true

# Filesystem
TARGET_FS_CONFIG_GEN += $(COMMON_PATH)/config.fs

# Graphics
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_USES_GRALLOC1_ADAPTER := true
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x02000000U
TARGET_DISABLE_POSTRENDER_CLEANUP := true
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# Init configuration for init_sony
BOARD_USES_INIT_SONY := true

# Legacy memfd
TARGET_HAS_MEMFD_BACKPORT := true

# Lights HAL
TARGET_PROVIDES_LIBLIGHT := true

# Partition information
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Power
TARGET_USES_INTERACTION_BOOST := true

# SELinux
include device/qcom/sepolicy-legacy/sepolicy.mk

BOARD_VENDOR_SEPOLICY_DIRS += \
    device/sony/msm8974-common/sepolicy

# Shims
TARGET_LD_SHIM_LIBS += \
    /system/vendor/lib/libril-qc-qmi-1.so|libaudioclient_shim.so

# Treble
DEVICE_MANIFEST_FILE := device/sony/msm8974-common/treble-manifest.xml
ifneq ($(BOARD_HAVE_RADIO),false)
    DEVICE_MANIFEST_FILE += device/sony/msm8974-common/treble-manifest-radio.xml
endif
PRODUCT_ENFORCE_VINTF_MANIFEST_OVERRIDE := true
