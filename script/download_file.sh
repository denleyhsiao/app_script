#!/usr/bin/env bash
# 
# @author: denley@justtodo.com 
# @date: 2024-05-18 14:21 
# @description: 

function do_download_file()
{
  local SOURCE_FILE=$1
  local TARGET_FILE=$2
  curl -fLo ${TARGET_FILE} ${SOURCE_FILE} --create-dirs
}

function download_file()
{
  local TARGET_FILE=$2
  [ -f ${TARGET_FILE} ] && rm -f ${TARGET_FILE}
  do_download_file $1 $2
}

function download_file_if_not_exist()
{
  local TARGET_FILE=$2
  [ ! -f ${TARGET_FILE} ] && do_download_file $1 $2
}

function do_clone_repo()
{
  local GITHUB_USER=$1
  local GITHUB_REPO=$2
  local TARGET_PATH=$3
  git clone --recursive git@github.com:${GITHUB_USER}/${GITHUB_REPO} ${TARGET_PATH}
}

function clone_repo()
{
  local TARGET_PATH=$3
  [ -d ${TARGET_PATH} ] && rm -fr ${TARGET_PATH}
  do_clone_repo $1 $2 $3
}

function clone_repo_if_not_exist()
{
  local TARGET_PATH=$3  
  [ ! -d ${TARGET_PATH} ] && do_clone_repo $1 $2 $3
}

function do_link_clone_file()
{
  local SOURCE_FILE=$3/$4
  local TARGET_FILE=$5
  clone_repo $1 $2 $3
  ln -s ${SOURCE_FILE} ${TARGET_FILE}
}

function link_clone_file()
{
  local TARGET_FILE=$5
  ([ -L ${TARGET_FILE} ] || [ -f ${TARGET_FILE} ]) && rm -f ${TARGET_FILE}
  do_link_clone_file $1 $2 $3 $4 $5
}

function link_clone_file_if_not_exist()
{
  local TARGET_FILE=$5
  [ ! -L ${TARGET_FILE} ] && [ ! -f ${TARGET_FILE} ] && do_link_clone_file $1 $2 $3 $4 $5
}
