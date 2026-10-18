#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y apt-utils
sudo apt-get install -y python2
sudo apt-get install -y python-is-python2
sudo apt-get install -y libncurses5
sudo apt-get install -y git-lfs

git config --global user.email "david921518@qq.com"
git config --global user.name "david921518"

export REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo'

git config --global url."https://mirrors.ustc.edu.cn/aosp/".insteadOf https://android.googlesource.com/
git config --global url."https://gitclone.com/github.com/LineageOS/".insteadOf https://github.com/LineageOS/

git lfs install

#repo init -u https://github.com/LineageOS/android.git -b lineage-15.1 --git-lfs --no-clone-bundle
#repo init -u https://mirrors.cernet.edu.cn/lineageOS/LineageOS/android.git -b lineage-15.1 --git-lfs --no-clone-bundle
repo sync -c -j 4 --force-sync

source build_cherry_env

source build/envsetup.sh

croot

breakfast cherry

brunch cherry

