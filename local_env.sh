#!/bin/bash


sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y apt-utils
sudo apt-get install -y python2
#sudo apt-get install -y python-is-python2
#sudo apt-get install -y python-is-python3
sudo apt-get install -y libncurses5
sudo apt-get install -y libtinfo5
sudo apt-get install -y git-lfs

#sudo nano /etc/java-8-openjdk/security/java.security

git config --global user.email "david921518@qq.com"
git config --global user.name "david921518"

#export REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo'
unset REPO_URL
#export ALL_PROXY=http://127.0.0.1:7897/
export ALL_PROXY=http://192.168.0.138:7897/

#git config --global url."https://mirrors.ustc.edu.cn/aosp/".insteadOf https://android.googlesource.com/
#git config --global url."https://gitclone.com/github.com/LineageOS/".insteadOf https://github.com/LineageOS/

git config --global http.postBuffer 524288000
git config --global http.maxRequestBuffer 100M
git config --global http.version HTTP/1.1
git config --global gc.auto 0

#git lfs install
#git lfs install --skip-repo
