## Build
  repo init -u https://github.com/LineageOS/android.git -b lineage-18.1
  repo sync --force-sync
  source build/envsetup.sh


 #Repos
 git clone -b lineage-17.1 https://github.com/NyQuilXT/android_device_sony_honami.git device/sony/honami
 git clone -b r11.1 https://github.com/AICP/device_sony_rhine-common.git device/sony/rhine-common
 git clone -b r11.1 https://github.com/AICP/device_sony_msm8974-common.git device/sony/msm8974-common
 git clone -b r11.1 https://github.com/daviiid99/kernel_sony_msm8974.git kernel/sony/msm8974
 git clone -b r11.1 https://github.com/AICP/proprietary_vendor_sony.git vendor/sony
 git clone -b r11.1-caf https://github.com/AICP/device_sony_common.git device/sony/common-caf
 git clone -b q10.0 https://github.com/AICP/hardware_sony_macaddrsetup.git hardware/sony/macaddrsetup
 git clone -b q10.0 https://github.com/AICP/hardware_sony_thermanager.git hardware/sony/thermanager
 git clone -b q10.0 https://github.com/AICP/hardware_sony_timekeep.git hardware/sony/timekeep
 git clone -b q10.0 https://github.com/AICP/external_sony_boringssl-compat.git external/sony/boringssl-compat
 
 #Picks
 repopick -f 295701 # Add product_launched_with_j_mr2 for JellyBean 4.3
 repopick 292788 # adb
 repopick -g https://gerrit.aicp-rom.com 104259 # rhine-common
 repopick -g https://gerrit.aicp-rom.com 106145 106147 # 8974-common
 repopick -g https://gerrit.aicp-rom.com 105818 -P system/core
 repopick -g https://gerrit.aicp-rom.com 105646 -P frameworks/native
 repopick -g https://gerrit.aicp-rom.com 105644 -P build/make
 repopick -g https://gerrit.aicp-rom.com 105645 -P build/soong
 repopick -g https://gerrit.aicp-rom.com 105817 -P vendor/lineage
 
 ## Build
 source build/envsetup.sh
 lunch lineage_honami-userdebug
 make bacon
