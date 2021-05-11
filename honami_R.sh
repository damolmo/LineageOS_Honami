#Dependencies
sudo apt update&&sudo apt install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev python

#Install latest repo
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo

#Install Android SDK Platform Tools
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
unzip platform-tools-latest-linux.zip -d ~
cat >> ~/.profile<< EOF
if [ -d "\$HOME/platform-tools" ] ; then
    PATH="\$HOME/platform-tools:\$PATH"
fi
EOF

#Set build cache to 50G
export USE_CCACHE=1
export CCACHE_DIR=~/.ccache
source ~/.bashrc
ccache -M 50G

#Git config
git config --global user.email "you@example.com"
git config --global user.name "Your Name

#Sync
mkdir -p ~/android/lineage
repo init -u git://github.com/LineageOS/android.git -b lineage-18.1
repo sync
source build/envsetup.sh

 #Repos
 git clone -b lineage-18.1 https://github.com/daviiid99/android_device_sony_honami device/sony/honami
 git clone -b r11.1 https://github.com/daviiid99/device_sony_rhine-common device/sony/rhine-common
 git clone -b r11.1 https://github.com/daviiid99/device_sony_msm8974-common device/sony/msm8974-common
 git clone -b r11.1 https://github.com/daviiid99/kernel_sony_msm8974.git kernel/sony/msm8974
 git clone -b r11.1 https://github.com/AICP/proprietary_vendor_sony.git vendor/sony
 git clone -b r11.1-caf https://github.com/AICP/device_sony_common.git device/sony/common-caf
 git clone -b q10.0 https://github.com/AICP/hardware_sony_macaddrsetup.git hardware/sony/macaddrsetup
 git clone -b q10.0 https://github.com/AICP/hardware_sony_thermanager.git hardware/sony/thermanager
 git clone -b q10.0 https://github.com/AICP/hardware_sony_timekeep.git hardware/sony/timekeep
 git clone -b q10.0 https://github.com/AICP/external_sony_boringssl-compat.git external/sony/boringssl-compat 
 git clone -b patches https://github.com/daviiid99/LineageOS_Honami.git RPatches/
 
 #Patches
 patch -d system/core -p1 <  RPatches/system_core/android_bp.patch
 patch -d system/core -p1 <  RPatches/system_core/service_cpp.patch
 patch -d frameworks/native -p1 <  RPatches/frameworks_native/libs/renderengine/android_bp.patch
 patch -d frameworks/native -p1 <  RPatches/frameworks_native/libs/renderengine/gl/filters/blurfilter_cpp.patch
 patch -d build/make -p1 <  RPatches/build_make_core/soong_config_mk.patch
 patch -d build/soong -p1 <  RPatches/build_soong_android/variable_go.patch
 patch -d vendor/lineage -p1 <  RPatches/vendor_lineage/build_soong/android_bp.patch
 patch -d vendor/lineage -p1 <  RPatches/vendor_lineage/config/BoardConfigSoong_mk.patch
 
 #Build
lunch lineage_honami-userdebug
brunch honami

