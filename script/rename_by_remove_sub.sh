#!/usr/bin/env bash
# 
# @author: denley@justtodo.com 
# @date: 2023-09-04 23:02 
# @description: 

function set_default() {
  [ -n "$1" ] && echo $1 || echo $2
}

function rename_by_remove_sub() {
  if [ "`ls -A $1`" == "" ]; then
    return
  fi
  
  for child_name in "$1"/*; do
    if [ -d "$child_name" ]; then
      rename_by_remove_sub $child_name $2
    elif [ -f "$child_name" ]; then
      file_name=$(basename "$child_name")
      new_file_name="${file_name//$2/}"
      new_file_path="$1/$new_file_name"
      if [ "$child_name" != "$new_file_path" ]; then
        mv "$child_name" "$new_file_path"
        echo "  renamed $child_name to $new_file_path"
      fi
    fi
  done
}

file_path=$(set_default "$1" ".")
text_to_remove=$(set_default "$2" "【淘宝店铺：星球素材库】")

echo "Start remove $text_to_remove from $file_path ......"
rename_by_remove_sub $file_path $text_to_remove
echo "Finished"


