#!/bin/bash

# if [[ -z $1 ]]; then
# 	< ~/scripts/wallarg
# else
# 	if [[ "$1" == base16-*.png ]]; then
# 		~/scripts/16script/16script.sh "${1::-4}" ~/scripts/16script/16scriptpart2.sh
# 	else
# 		wal -i $1 -t -o ~/scripts/walscript.sh
# 	fi
# fi

scriptdir="${HOME}/scripts"

(
echo '#!/bin/bash'
echo ""
) > "${scriptdir}/rice.sh"

if [[ "$1" == base16-*.png ]]; then
	(
	echo 'sh -c "~/scripts/16script/16script.sh $(cat ~/.cache 16script/lastuse)" ~/scripts/16script/16scriptpart2.sh'
	) > "${scriptdir}/rice.sh"
	~/scripts/16script/16script.sh "${1::-4}" ~/scripts/16script/16scriptpart2.sh
else
	echo "wal -i $1" > "${scriptdir}/rice.sh"
	wal -i "$1"
fi
