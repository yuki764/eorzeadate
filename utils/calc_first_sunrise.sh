#!/bin/bash

utils_dir=$(dirname $0)

next_year=$(expr $(date +'%Y') + 1)

midnight_eotime=$(LANG=C ${utils_dir}/../eodate --date="${next_year}/01/01 00:00:00" | sed -e "s/.* //")
midnight_eohour=$(echo $midnight_eotime | sed -e "s/:[0-9][0-9]$//")
midnight_eomin=$(echo $midnight_eotime | sed -e "s/^[0-9][0-9]://")

diff_eohour=$(expr \( 29 - $midnight_eohour \) % 24)
diff_eomin=$(expr 60 - $midnight_eomin)

diff_earthsec_of_eohour=$(expr $diff_eohour \* 175)
diff_earthsec_of_eomin=$(expr \( $diff_eomin \* 175 \) / 60)
diff_earthsec=$(expr $diff_earthsec_of_eohour + $diff_earthsec_of_eomin)

# print results
echo -n "Earth date: "
date --date="${next_year}/01/01 00:00:00 $diff_earthsec seconds"
echo -n "Eorzea date: "
${utils_dir}/../eodate --date="${next_year}/01/01 00:00:00 $diff_earthsec seconds"
