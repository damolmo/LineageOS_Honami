# Sony Xperia Z1 (Honami)
<br/>

## Build Instructions with manifest

Initialize LineageOS repo:
```
mkdir -p ~/android/lineage
cd ~/android/lineage
repo init -u git://github.com/LineageOS/android.git -b lineage-18.1
```

Download latest manifest:
```
mkdir -p .repo/local_manifests
curl https://raw.githubusercontent.com/daviiid99/LineageOS_Honami/manifest/honami.xml > .repo/local_manifests/honami.xml
curl https://raw.githubusercontent.com/daviiid99/LineageOS_Honami/manifest/gapps.xml > .repo/local_manifests/gapps.xml
```
Sync repo:
```
repo sync
source build/envsetup.sh
```

Apply patches:
```
patch -d packages/apps/Settings -p1 <  RPatches/Display_NFC_Settings.patch #Fixes missing NFC icon in Settings
patch -d vendor/qcom/opensource/dataservices -p1 <  RPatches/RMNET_NETLINK_NEW_VND_WITH_PREFIX.patch #Fixes build process
patch -d frameworks/base -p1 < RPatches/Disable_Wallpaper_Zoom.patch #Fixes Android R Wallpaper Zoom
patch -d vendor/lineage -p1 < RPatches/Whitelist_priv-app_Permissions.patch #Fixes priv-app permissions 
 
```

(Optional) Replace default wallpaper with LineageOS brand logo wallpaper
 ```
cd vendor/lineage/overlay/common/frameworks/base/core/res/res/drawable-hdpi
rm default_wallpaper.png
wget https://github.com/daviiid99/daviiid99/releases/download/honami/default_wallpaper.png
cd ../

cd drawable-nodpi
rm default_wallpaper.png
wget https://github.com/daviiid99/daviiid99/releases/download/honami/default_wallpaper.png
cd ../

cd drawable-sw600dp-nodpi
rm default_wallpaper.png
wget https://github.com/daviiid99/daviiid99/releases/download/honami/default_wallpaper.png
cd ../

cd drawable-sw720dp-nodpi
rm default_wallpaper.png
wget https://github.com/daviiid99/daviiid99/releases/download/honami/default_wallpaper.png
cd ../

cd drawable-xhdpi
rm default_wallpaper.png
wget https://github.com/daviiid99/daviiid99/releases/download/honami/default_wallpaper.png
cd ../

cd drawable-xxhdpi
rm default_wallpaper.png
wget https://github.com/daviiid99/daviiid99/releases/download/honami/default_wallpaper.png
cd ../

cd drawable-xxxhdpi
rm default_wallpaper.png
wget https://github.com/daviiid99/daviiid99/releases/download/honami/default_wallpaper.png
cd ../../../../../../../../../../
```

(Optional) LineageOS Updater app shorcut in drawer
```
mkdir -p out/target/product/honami/system/product/priv-app
cd out/target/product/honami/system/product/priv-app
mkdir Up&& cd Up
wget https://github.com/daviiid99/daviiid99/releases/download/honami/Up.apk
cd ../../../../../../../../
```

Download OpenGApps source
```
sudo apt install git-lfs
git lfs install
repo forall -c git lfs pull
```

Build:
```
brunch honami
```

<br/>
NOTE: If the build process fails with the following error: 
invalid file path 'frameworks/base/core/res/res/values/config.xml.orig'
<br/>Do:

```
rm ~/android/lineage/frameworks/base/core/res/res/values/config.xml.orig
```
