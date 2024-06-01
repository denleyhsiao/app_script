#!/usr/bin/env bash
# 
# @author: denley@justtodo.com 
# @date: 2024-06-01 14:21 
# @description: 

echo "OS clear ..."
sudo apt-get autoremove clean
sudo rm -rf /var/lib/apt/lists/*
echo "OS clear end"
