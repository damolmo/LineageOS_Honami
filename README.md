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
 
```

(Optional) Include Prebuilt GApps
```
 mkdir -p out/target/product/honami/system/product
 cd out/target/product/honami/system/
 wget https://github.com/daviiid99/daviiid99/releases/download/honami/product.zip
 unzip product.zip  # GApps base package
 rm product.zip
 cd ../../../../../
 ```
(Optional) Replace default wallpaper with LineageOS brand logo wallpaper
 ```
cd overlay/common/frameworks/base/core/res/res/drawable-hdpi
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
cd ../../../../../../../../
```

Build:
```
brunch honami
```
