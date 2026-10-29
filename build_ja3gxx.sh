#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y apt-utils
sudo apt-get install -y python2
sudo apt-get install -y python-is-python2
#sudo apt-get install -y python-is-python3
sudo apt-get install -y libncurses5
sudo apt-get install -y libtinfo5
sudo apt-get install -y git-lfs

#sudo nano /etc/java-8-openjdk/security/java.security

#git config --global user.email "david921518@qq.com"
#git config --global user.name "david921518"

#mkdir -p ~/bin
#curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
#chmod a+x ~/bin/repo
#sudo cp -af ~/bin/repo /usr/local/bin/

#export REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo'
#export ALL_PROXY=http://127.0.0.1:7897/
#export ALL_PROXY=http://192.168.0.138:7897/

#git config --global url."https://mirrors.ustc.edu.cn/aosp/".insteadOf https://android.googlesource.com/
#git config --global url."https://gitclone.com/github.com/LineageOS/".insteadOf https://github.com/LineageOS/

#git config --global http.postBuffer 524288000
#git config --global http.maxRequestBuffer 100M
#git config --global http.version HTTP/1.1
#git config --global gc.auto 0

#git lfs install
git lfs install --skip-repo

repo init -u https://github.com/LineageOS/android.git -b cm-14.1 --git-lfs --no-clone-bundle
#repo init -u https://mirrors.cernet.edu.cn/lineageOS/LineageOS/android.git -b cm-14.1 --git-lfs --no-clone-bundle

mkdir -p .repo/local_manifests
cp -f manifest-cm-14.1/local_manifest.xml .repo/local_manifests/

#repo sync -c -j1 --force-sync
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

#3) Apply all Patches

cd bootable/recovery-twrp
#git fetch https://gerrit.omnirom.org/android_bootable_recovery refs/changes/96/22096/11 && git cherry-pick FETCH_HEAD
#git fetch https://github.com/omnirom/android_bootable_recovery refs/changes/96/22096/11 && git cherry-pick FETCH_HEAD
patch -p1 < ../../manifest-cm-14.1/android_bootable_recovery_001_fix_for_LineageOS_build.patch
cd ../..

# don't need it now!
#cd external/libselinux
#git am ../../device/samsung/exynos5410-common/patches/external_libselinux/556a9e925053e0b62f495233e165112e12b5d869.patch
#cd ../..

# use latest code
cd frameworks/base
#git am ../../device/samsung/exynos5410-common/patches/frameworks_base/0001-DO-NOT-MERGE-PATCH-Zygote-Stop-breaking-the-entire-s.patch
patch -p1 < ../../device/samsung/exynos5410-common/patches/frameworks_base/0001-DO-NOT-MERGE-PATCH-Zygote-Stop-breaking-the-entire-s.patch
#git fetch https://github.com/LineageOS/android_frameworks_base refs/changes/45/169945/2 && git cherry-pick FETCH_HEAD
patch -p1 < ../../manifest-cm-14.1/android_frameworks_base_001_clang++_unknown_argument_mapcs.patch
cd ../..

# don't need it now!
#cd system/core
#git am ../../device/samsung/exynos5410-common/patches/system_core/79ce3d6a96f3d381dc4db1aac45ccb788e1276ab.patch
#cd ../..


source build_ja3gxx_env

#. build/envsetup && lunch lineage_ja3gxx-userdebug

source build/envsetup.sh

croot

#breakfast lineage_ja3gxx-userdebug
#lunch lineage_ja3gxx-userdebug
#brunch lineage_ja3gxx-userdebug
brunch ja3gxx | tee b_$(date '+%Y%m%d_%H%M%S').log
