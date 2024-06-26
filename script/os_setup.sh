#!/usr/bin/env bash
# 
# @author: denley@justtodo.com 
# @date: 2024-05-18 23:28 
# @description: 

# COPY from os_common.sh
CURRENT_PATH=$(cd $(dirname $0); pwd)
WORK_PATH=$HOME/work
TEMP_PATH=$HOME/temp
GITHUB_USER=denleyhsiao
SCRIPT_REPO=app_script
RAW_GITHUB_PREFIX=https://raw.githubusercontent.com

DOWNLOAD_FILE=download_file.sh
DOWNLOAD_SOURCE_FILE=${RAW_GITHUB_PREFIX}/${GITHUB_USER}/${SCRIPT_REPO}/master/script/${DOWNLOAD_FILE}
DOWNLOAD_TARGET_FILE=${TEMP_PATH}/${DOWNLOAD_FILE}
[ ! -f ${DOWNLOAD_TARGET_FILE} ] && curl -fLo ${DOWNLOAD_TARGET_FILE} ${DOWNLOAD_SOURCE_FILE} --create-dirs
sudo chmod a+x ${DOWNLOAD_TARGET_FILE}
source ${DOWNLOAD_TARGET_FILE}

OS_COMMON_FILE=os_common.sh
OS_COMMON_SOURCE_FILE=${RAW_GITHUB_PREFIX}/${GITHUB_USER}/${SCRIPT_REPO}/master/script/${OS_COMMON_FILE}
OS_COMMON_TARGET_FILE=${TEMP_PATH}/${OS_COMMON_FILE}
download_file_if_not_exist ${OS_COMMON_SOURCE_FILE} ${OS_COMMON_TARGET_FILE}
sudo chmod a+x ${OS_COMMON_TARGET_FILE}

UPDATE_CONFIG_FILE=update_config.sh
UPDATE_CONFIG_SOURCE_FILE=${RAW_GITHUB_PREFIX}/${GITHUB_USER}/${SCRIPT_REPO}/master/script/${UPDATE_CONFIG_FILE}
UPDATE_CONFIG_TARGET_FILE=${TEMP_PATH}/${UPDATE_CONFIG_FILE}
download_file_if_not_exist ${UPDATE_CONFIG_SOURCE_FILE} ${UPDATE_CONFIG_TARGET_FILE}
sudo chmod a+x ${UPDATE_CONFIG_TARGET_FILE}
source ${UPDATE_CONFIG_TARGET_FILE}

UPDATE_RASPI_FILE=update_raspi.sh
UPDATE_RASPI_SOURCE_FILE=${RAW_GITHUB_PREFIX}/${GITHUB_USER}/${SCRIPT_REPO}/master/script/${UPDATE_RASPI_FILE}
UPDATE_RASPI_TARGET_FILE=${TEMP_PATH}/${UPDATE_RASPI_FILE}
download_file_if_not_exist ${UPDATE_RASPI_SOURCE_FILE} ${UPDATE_RASPI_TARGET_FILE}
sudo chmod a+x ${UPDATE_RASPI_TARGET_FILE}
source ${UPDATE_RASPI_TARGET_FILE}

INSTALL_BASE_FILE=install_base.sh
INSTALL_BASE_SOURCE_FILE=${RAW_GITHUB_PREFIX}/${GITHUB_USER}/${SCRIPT_REPO}/master/script/${INSTALL_BASE_FILE}
INSTALL_BASE_TARGET_FILE=${TEMP_PATH}/${INSTALL_BASE_FILE}
download_file_if_not_exist ${INSTALL_BASE_SOURCE_FILE} ${INSTALL_BASE_TARGET_FILE}
sudo chmod a+x ${INSTALL_BASE_TARGET_FILE}

INSTALL_ZSH_FILE=install_zsh.sh
INSTALL_ZSH_SOURCE_FILE=${RAW_GITHUB_PREFIX}/${GITHUB_USER}/${SCRIPT_REPO}/master/script/${INSTALL_ZSH_FILE}
INSTALL_ZSH_TARGET_FILE=${TEMP_PATH}/${INSTALL_ZSH_FILE}
download_file_if_not_exist ${INSTALL_ZSH_SOURCE_FILE} ${INSTALL_ZSH_TARGET_FILE}
sudo chmod a+x ${INSTALL_ZSH_TARGET_FILE}
source ${INSTALL_ZSH_TARGET_FILE}

OS_CLEAR_FILE=os_clear.sh
OS_CLEAR_SOURCE_FILE=${RAW_GITHUB_PREFIX}/${GITHUB_USER}/${SCRIPT_REPO}/master/script/${OS_CLEAR_FILE}
OS_CLEAR_TARGET_FILE=${TEMP_PATH}/${OS_CLEAR_FILE}
download_file_if_not_exist ${OS_CLEAR_SOURCE_FILE} ${OS_CLEAR_TARGET_FILE}
sudo chmod a+x ${OS_CLEAR_TARGET_FILE}
source ${OS_CLEAR_TARGET_FILE}

reboot