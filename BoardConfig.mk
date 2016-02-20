# inherit from the proprietary version
-include vendor/sony/jlo/BoardConfigVendor.mk

#inherit from the common tamsui definitions
-include device/sony/tamsui-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH += device/sony/jlo/include

# Kernel
TARGET_KERNEL_CONFIG :=  cm_tamsui_jlo_defconfig
BOARD_KERNEL_CMDLINE := device/sony/jlo/rootdir/cmdline.txt

# WiFi
BOARD_WLAN_DEVICE                := bcmdhd
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/bcm4330/sdio_g_pool_pno_pktfilter_keepalive_wapi_wme_idsup_idauth_sta_aoe.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/bcm4330/sdio_g_pool_pno_pktfilter_keepalive_wapi_wme_idsup_idauth_apsta_aoe.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/system/etc/bcm4330/sdio_g_pool_pno_pktfilter_keepalive_wapi_wme_idsup_idauth_p2p_aoe.bin"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
BOARD_LEGACY_NL80211_STA_EVENTS  := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/jlo/bluedroid

# CM Hardware tunables
BOARD_HARDWARE_CLASS += device/sony/jlo/cmhw

# Partition information
BOARD_VOLD_MAX_PARTITIONS := 16

#twrp 
DEVICE_RESOLUTION := 480x800
RECOVERY_SDCARD_ON_DATA := true -- this enables proper handling of /data/media on devices that have this folder for storage (most Honeycomb and devices that originally shipped with ICS like Galaxy Nexus)
RECOVERY_GRAPHICS_USE_LINELENGTH := true -- fixes slanty looking graphics on some devices
BOARD_HAS_NO_REAL_SDCARD := true -- disables things like sdcard partitioning and may save you some space if TWRP isn't fitting in your recovery patition
TW_INCLUDE_DUMLOCK := true -- includes HTC Dumlock for devices that need it
TW_NO_BATT_PERCENT := true -- disables the display of the battery percentage for devices that don't support it properly
TW_CUSTOM_POWER_BUTTON := 107 -- custom maps the power button for the lockscreen
TW_NO_REBOOT_BOOTLOADER := true -- removes the reboot bootloader button from the reboot menu
TW_NO_REBOOT_RECOVERY := true -- removes the reboot recovery button from the reboot menu
TW_NO_USB_STORAGE := true -- removes the USB storage button on devices that don't support USB storage
RECOVERY_TOUCHSCREEN_SWAP_XY := true -- swaps the mapping of touches between the X and Y axis
RECOVERY_TOUCHSCREEN_FLIP_Y := true -- flips y axis touchscreen values
RECOVERY_TOUCHSCREEN_FLIP_X := true -- flips x axis touchscreen values
TW_ALWAYS_RMRF := true -- forces the rm -rf option to always be on (needed for some Motorola devices)
TW_NEVER_UNMOUNT_SYSTEM := true -- never unmount system (needed for some Motorola devices)
TW_INCLUDE_INJECTTWRP := true -- adds ability to inject TWRP into some Samsung boot images for Samsung devices that have recovery as a second ramdisk in the boot image
TW_DEFAULT_EXTERNAL_STORAGE := true -- defaults to external storage instead of internal on dual storage devices (largely deprecated)
TWRP_EVENT_LOGGING := true -- enables touch event logging to help debug touchscreen issues (don't leave this on for a release - it will fill up your logfile very quickly)
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"

BOARD_HAS_FLIPPED_SCREEN := true -- flips the screen upside down for screens that were mounted upside-down
TARGET_PREBUILT_RECOVERY_KERNEL := path/to/kernel -- use to specify a kernel specifically for building recovery

# Recovery
TARGET_RECOVERY_FSTAB := device/sony/jlo/rootdir/fstab.sony
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x01400000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x01400000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 524288000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_SDCARD_INTERNAL_DEVICE := /dev/block/mmcblk0p16

TARGET_OTA_ASSERT_DEVICE := ST26i,ST26a,jlo
