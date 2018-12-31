#!/bin/bash

utils_dir=$(dirname $0)

next_year=$(expr $(date +'%Y') + 1)

for m in {0..72}; do
	check_hour=$(expr $m / 60)
	check_min=$(expr $m % 60)
	check_time=$(printf "%02d:%02d" $check_hour $check_min)
	check_eotime=$(${utils_dir}/../eodate --date="${next_year}/01/01 ${check_time}" | sed -e "s/.* //")
	if [ "$check_eotime" = "00:00" ]; then
		break
	fi
done
echo "${check_time}"
