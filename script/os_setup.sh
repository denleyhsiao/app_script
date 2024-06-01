#!/usr/bin/env bash
# 
# @author: denley@justtodo.com 
# @date: 2024-05-18 23:28 
# @description: 

CURRENT_PATH=$(cd $(dirname $0); pwd)
WORK_PATH=$HOME/work
TEMP_PATH=$HOME/temp
GITHUB_USER=denleyhsiao
CONFIG_REPO=app_config
SCRIPT_REPO=app_script
ACTION_NAME=${1:-download}
ACTION_NAME=${ACTION_NAME,,}
RAW_GITHUB_PREFIX=https://raw.githubusercontent.com

DOWNLOAD_FILE=download_file.sh
DOWNLOAD_SOURCE_FILE=${RAW_GITHUB_PREFIX}/${GITHUB_USER}/${SCRIPT_REPO}/master/script/${DOWNLOAD_FILE}
DOWNLOAD_TARGET_FILE=${TEMP_PATH}/${DOWNLOAD_FILE}
[ ! -f ${DOWNLOAD_TARGET_FILE} ] && curl -fLo ${DOWNLOAD_TARGET_FILE} ${DOWNLOAD_SOURCE_FILE} --create-dirs
source ${DOWNLOAD_TARGET_FILE}

VIM_CONFIG_FILE=vim/vimrc.vim
VIM_CONFIG_SOURCE_FILE=${RAW_GITHUB_PREFIX}/${GITHUB_USER}/${CONFIG_REPO}/master/${VIM_CONFIG_FILE}
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
 link_clone_file_if_not_exist ${GITHUB_USER} ${CONFIG_REPO} ${WORK_PATH}/${CONFIG_REPO} ${VIM_CONFIG_FILE} ${VIM_CONFIG_TARGET_FILE}
 link_clone_file_if_not_exist ${VIM_PLUG_USER} ${VIM_PLUG_REPO} ${WORK_PATH}/${VIM_PLUG_REPO} ${VIM_PLUG_FILE} ${VIM_PLUG_TARGET_FILE}
else
  echo "Not support action: $1"
fi
