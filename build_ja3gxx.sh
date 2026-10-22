#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y apt-utils
sudo apt-get install -y python2
sudo apt-get install -y python-is-python2
sudo apt-get install -y libncurses5
sudo apt-get install -y git-lfs

git config --global user.email "david921518@qq.com"
git config --global user.name "david921518"

export REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo'

git config --global url."https://mirrors.ustc.edu.cn/aosp/".insteadOf https://android.googlesource.com/
#git config --global url."https://gitclone.com/github.com/LineageOS/".insteadOf https://github.com/LineageOS/

#git config --global http.postBuffer 524288000
#git config --global http.maxRequestBuffer 100M
#git config --global http.version HTTP/1.1
#git config --global gc.auto 0

git lfs install

#repo init -u https://github.com/LineageOS/android.git -b cm-14.1 --git-lfs --no-clone-bundle
repo init -u https://mirrors.cernet.edu.cn/lineageOS/LineageOS/android.git -b cm-14.1 --git-lfs --no-clone-bundle

#mkdir -p .repo/local_manifests
#mv local_manifest.xml .repo/local_manifests/

repo sync -c -j1 --force-sync

#3) Apply all Patches

cd bootable/recovery-twrp
git fetch https://gerrit.omnirom.org/android_bootable_recovery refs/changes/96/22096/11 && git cherry-pick FETCH_HEAD
cd ../..
cd external/libselinux
git am ../../device/samsung/exynos5410-common/patches/external_libselinux/556a9e925053e0b62f495233e165112e12b5d869.patch
cd ../..
cd frameworks/base
git am ../../device/samsung/exynos5410-common/patches/frameworks_base/0001-DO-NOT-MERGE-PATCH-Zygote-Stop-breaking-the-entire-s.patch
git fetch https://github.com/LineageOS/android_frameworks_base refs/changes/45/169945/2 && git cherry-pick FETCH_HEAD
cd ../..
cd system/core
git am ../../device/samsung/exynos5410-common/patches/system_core/79ce3d6a96f3d381dc4db1aac45ccb788e1276ab.patch
cd ../..


source build_ja3gxx_env

source build/envsetup.sh

croot

breakfast lineage_ja3gxx-userdebug

brunch lineage_ja3gxx-userdebug



