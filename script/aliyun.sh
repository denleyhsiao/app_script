#!/usr/bin/env bash
# 
# @author: denley@justtodo.com 
# @date: 2022-07-08 09:40 
# @description: 

apt-get update -y
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
adduser argusai
echo 'argusai ALL=(ALL:ALL) ALL' | sudo EDITOR='tee -a' visudo
usermod -aG docker argusai

# https://docs.docker.com/compose/install/
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
  

