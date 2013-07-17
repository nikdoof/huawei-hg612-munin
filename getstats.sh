#!/bin/sh

statsfile=${statsfile:-/var/lib/munin/plugin-state/huawei-hg612-munin-output.txt}

expect `dirname $0`/huawei.expect  | tee | tr -d "\015"  > $statsfile.new

if [ -s "$statsfile.new" ]; then
	mv $statsfile.new $statsfile
else
	echo "Empty output from expect script"
fi
