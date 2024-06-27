#!/bin/sh -l

echo "Parameter passed: $1"
value="UNKNOWN"

local_output_file = "./github.output"
date >> $local_output_file

case "$1" in
  cpu)
    value=$(cat /proc/cpuinfo |grep -c processor| awk '{print $1}')
    ;;
  memory)
    value=$(cat /proc/meminfo | grep MemTotal | awk '{print $2}')
    ;;
  *)
    echo "Invalid value passed, must be 'cpu' or 'memory'!"
    ;;
esac

git_hub_output="value=$value"
echo "Returning $git_hub_output"
echo "git_hub_output" >> $local_output_file
echo "$git_hub_output" >> $GITHUB_OUTPUT
