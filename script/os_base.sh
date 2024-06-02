#!/usr/bin/env bash
# 
# @author: denley@justtodo.com 
# @date: 2024-06-01 17:08 
# @description: 

echo "OS base ..."

# 修正时间(Asian/Shanghai)
sudo dpkg-reconfigure tzdata

## gpu_mem=16
sudo vim /boot/firmware/config.txt

sudo apt-get install git vim tmux curl wget -y
sudo apt-get upgrade git vim tmux curl wget  -y
echo "OS base end"