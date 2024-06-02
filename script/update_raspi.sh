#!/usr/bin/env bash
# 
# @author: denley@justtodo.com 
# @date: 2024-06-01 11:05 
# @description: 

SOURCE_FILE=/etc/apt/sources.list
TARGET_FILE=${SOURCE_FILE}.bak
SOURCE_MIRROR=${1:-ports.ubuntu.com}
TARGET_MIRROR=${2:-mirrors.ustc.edu.cn}

echo "Update raspi ..."
[ ! -f ${TARGET_FILE} ] && sudo cp ${SOURCE_FILE} ${TARGET_FILE}
sudo sed -i "s/${SOURCE_MIRROR}/${TARGET_MIRROR}/g" ${SOURCE_FILE}
sudo apt-get update -y
sudo apt-get upgrade -y
echo "Update raspi end"