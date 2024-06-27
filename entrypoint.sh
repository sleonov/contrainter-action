#!/bin/sh -l

echo "Parameter passed: $1"
value="UNKNOWN"

case "$1" in
  cpu)
    value=$(grep -c processor /proc/cpuinfo | awk '{print $1}')
    ;;
  memory)
    value=$(grep MemTotal /proc/meminfo | awk '{print $2}')
    ;;
  *)
    echo "Invalid value passed, must be 'cpu' or 'memory'!"
    ;;
esac

git_hub_output="value=$value"
echo "Returning $git_hub_output"
echo "$git_hub_output" >> $GITHUB_OUTPUT
