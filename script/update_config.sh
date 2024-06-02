#!/usr/bin/env bash
# 
# @author: denley@justtodo.com 
# @date: 2024-06-01 11:26 
# @description: 

CONFIG_REPO=app_config
ACTION_NAME=${1:-download}
ACTION_NAME=${ACTION_NAME,,}
source os_common.sh

VIM_CONFIG_FILE=vim/vimrc.vim
VIM_CONFIG_SOURCE_FILE=${RAW_GITHUB_PREFIX}/${GITHUB_USER}/${CONFIG_REPO}/master/${VIM_CONFIG_FILE}
VIM_CONFIG_TARGET_FILE=$HOME/.vimrc

VIM_PLUG_USER=junegunn
VIM_PLUG_REPO=vim-plug
VIM_PLUG_FILE=plug.vim
VIM_PLUG_SOURCE_FILE=${RAW_GITHUB_PREFIX}/${VIM_PLUG_USER}/${VIM_PLUG_REPO}/master/${VIM_PLUG_FILE}
VIM_PLUG_TARGET_FILE=$HOME/.vim/autoload/${VIM_PLUG_FILE}

echo "Update config ..."
if [ "${ACTION_NAME}" == "download" ]; then
 download_file_if_not_exist ${VIM_CONFIG_SOURCE_FILE} ${VIM_CONFIG_TARGET_FILE}
 download_file_if_not_exist ${VIM_PLUG_SOURCE_FILE} ${VIM_PLUG_TARGET_FILE}
elif [ "${ACTION_NAME}" == "link" ]; then
 link_clone_file_if_not_exist ${GITHUB_USER} ${CONFIG_REPO} ${WORK_PATH}/${CONFIG_REPO} ${VIM_CONFIG_FILE} ${VIM_CONFIG_TARGET_FILE}
 link_clone_file_if_not_exist ${VIM_PLUG_USER} ${VIM_PLUG_REPO} ${WORK_PATH}/${VIM_PLUG_REPO} ${VIM_PLUG_FILE} ${VIM_PLUG_TARGET_FILE}
else
  echo "Not support action: $1"
fi
echo "Update config end"

