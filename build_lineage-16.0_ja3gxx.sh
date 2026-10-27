#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y apt-utils
sudo apt-get install -y python2
#sudo apt-get install -y python-is-python2
sudo apt-get install -y python-is-python3
sudo apt-get install -y libncurses5
sudo apt-get install -y git-lfs

#sudo nano /etc/java-8-openjdk/security/java.security

git config --global user.email "david921518@qq.com"
git config --global user.name "david921518"

mkdir -p ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
sudo cp -af ~/bin/repo /usr/local/bin/

#export REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo'
#export ALL_PROXY=http://127.0.0.1:7897/
#export ALL_PROXY=http://192.168.0.138:7897/

git config --global url."https://mirrors.ustc.edu.cn/aosp/".insteadOf https://android.googlesource.com/
#git config --global url."https://gitclone.com/github.com/LineageOS/".insteadOf https://github.com/LineageOS/

git config --global http.postBuffer 524288000
git config --global http.maxRequestBuffer 100M
git config --global http.version HTTP/1.1
git config --global gc.auto 0

#git lfs install
git lfs install --skip-repo

repo init -u https://github.com/LineageOS/android.git -b lineage-16.0 --git-lfs --no-clone-bundle
#repo init -u https://mirrors.cernet.edu.cn/lineageOS/LineageOS/android.git -b lineage-16.0 --git-lfs --no-clone-bundle

mkdir -p .repo/local_manifests
cp -f manifest-lineage-16.0/local_manifest.xml .repo/local_manifests/

repo sync -c -j1 --force-sync
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

#3) Apply all Patches

source build_ja3gxx_env

#unset WITH_TWRP

#. build/envsetup && lunch lineage_ja3gxx-userdebug

source build/envsetup.sh

croot

#breakfast lineage_ja3gxx-userdebug
lunch lineage_ja3gxx-userdebug
brunch lineage_ja3gxx-userdebug
