#!/bin/bash

function encode()
{
	iconv -f cp936 -t utf-8 "$1" > test
	# iconv -f iso8859-15 -t utf8 "$1" > test;
	cat test > "$1";
}

function walk()
{
  for file in `ls $1`
  do
    local path=$1"/"$file
    if [ -d $path ]
     then
      echo "DIR $path"
      walk $path
    else
      echo "FILE $path"
      encode $path
    fi
  done
}

if [ $# -ne 1 ]
then
  echo "USAGE: $0 TOP_DIR"
else
  walk $1
fi
