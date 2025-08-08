#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y python2
sudo apt-get install -y python-is-python2

git config --global user.email "david921518@qq.com"
git config --global user.name "david921518"

export REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo'

git config --global url."https://mirrors.ustc.edu.cn/aosp/".insteadOf https://android.googlesource.com/
git config --global url."https://gitclone.com/github.com/LineageOS/".insteadOf https://github.com/LineageOS/

#repo init -u https://mirrors.cernet.edu.cn/lineageOS/LineageOS/android.git -b lineage-15.1 --git-lfs --no-clone-bundle

repo sync -c -j 1

source build/envsetup.sh

breakfast che10
brunch che10

