#!/bin/bash

utils_dir=$(dirname $0)

next_year=$(expr $(date +'%Y') + 1)

for m in {0..72}; do
	check_hour=$(expr $m / 60)
	check_min=$(expr $m % 60)
	check_time=$(printf "%02d:%02d" $check_hour $check_min)
	check_eohour=$(LANG=C ${utils_dir}/../eodate --date="${next_year}/01/01 ${check_time}" | sed -e "s/.* //" | sed -e "s/:[0-9][0-9]$//")
	if [ "$check_eohour" = "06" ]; then
		m=$(expr $m - 1)
		result_hour=$(expr $m / 60)
		result_min=$(expr $m % 60)
		printf "%02d:%02d\n" $result_hour $result_min
		exit 0
	fi
done
