#!/usr/bin/env bash
# 
# @author: denley@justtodo.com 
# @date: 2024-05-18 23:28 
# @description: 

CURRENT_PATH=$(cd $(dirname $0); pwd)
MY_WORK_PATH=$HOME/work
MY_TEMP_PATH=$HOME/temp
MY_GITHUB_USER=denleyhsiao
MY_CONFIG_REPO=app_config
MY_SCRIPT_REPO=app_script
ACTION_NAME=${1:-download}
ACTION_NAME=${ACTION_NAME,,}
RAW_GITHUB_PREFIX=https://raw.githubusercontent.com

DOWNLOAD_SCRIPT_FILE=download_file.sh
DOWNLOAD_SCRIPT_SOURCE_FILE=${RAW_GITHUB_PREFIX}/${MY_GITHUB_USER}/${MY_SCRIPT_REPO}/master/script/${DOWNLOAD_SCRIPT_FILE}
DOWNLOAD_SCRIPT_TARGET_FILE=${MY_TEMP_PATH}/${DOWNLOAD_SCRIPT_FILE}
[ ! -f ${DOWNLOAD_SCRIPT_TARGET_FILE} ] && curl -fLo ${DOWNLOAD_SCRIPT_TARGET_FILE} ${DOWNLOAD_SCRIPT_SOURCE_FILE} --create-dirs
source ${DOWNLOAD_SCRIPT_TARGET_FILE}

VIM_CONFIG_FILE=vim/vimrc.vim
VIM_CONFIG_SOURCE_FILE=${RAW_GITHUB_PREFIX}/${MY_GITHUB_USER}/${MY_CONFIG_REPO}/master/${VIM_CONFIG_FILE}
VIM_CONFIG_TARGET_FILE=$HOME/.vimrc

VIM_PLUG_USER=junegunn
VIM_PLUG_REPO=vim-plug
VIM_PLUG_FILE=plug.vim
VIM_PLUG_SOURCE_FILE=${RAW_GITHUB_PREFIX}/${VIM_PLUG_USER}/${VIM_PLUG_REPO}/master/${VIM_PLUG_FILE}
VIM_PLUG_TARGET_FILE=$HOME/.vim/autoload/${VIM_PLUG_FILE}

if [ "${ACTION_NAME}" == "download" ]; then
 download_file_if_not_exist ${VIM_CONFIG_SOURCE_FILE} ${VIM_CONFIG_TARGET_FILE}
 download_file_if_not_exist ${VIM_PLUG_SOURCE_FILE} ${VIM_PLUG_TARGET_FILE}
elif [ "${ACTION_NAME}" == "link" ]; then
 link_clone_file_if_not_exist ${MY_GITHUB_USER} ${MY_CONFIG_REPO} ${MY_WORK_PATH}/${MY_CONFIG_REPO} ${VIM_CONFIG_FILE} ${VIM_CONFIG_TARGET_FILE}
 link_clone_file_if_not_exist ${VIM_PLUG_USER} ${VIM_PLUG_REPO} ${MY_WORK_PATH}/${VIM_PLUG_REPO} ${VIM_PLUG_FILE} ${VIM_PLUG_TARGET_FILE}
else
  echo "Not support action: $1"
fi
