#!/bin/bash

#TENEMOS QUE EJECUTAR CON ROOT#

locatedb="/home/luisana/Escritorio/test-git-2130074/codigos/locate_19code.db"

if [ "$(whoami)" != "haydo" ] ; then
  echo "Must be root to run this command." >&2
  exit 1
fi

find / -print > $locatedb

exit 0
