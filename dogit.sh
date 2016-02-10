#!/bin/bash

RED=`tput setaf 1`
GREEN=`tput setaf 2`
BOLD=`tput bold`
WHITE=`tput setaf 7`
NC=`tput sgr0` #reset

DEBUG=false
RELEASE=false

#revert all changes made by other scripts
if [ -h website/ni_multisim/static/multisim ]; then
        if [[ $(readlink website/ni_multisim/static/multisim) =~ "multisim/src" ]]; then
		DEBUG=true
		echo "currently using ${GREEN}debug${NC}"
	else
		RELEASE=true
		echo "currently using ${GREEN}release${NC}"
	fi
        rm website/ni_multisim/static/multisim
	mv website/ni_multisim/static/multisim.bak website/ni_multisim/static/multisim
else
	echo "currently ${GREEN}not${NC} using local multisim"
fi

if [ -f website/ni_multisim/ni_multisim/settings/dev.py.bak ]; then
	if [ -f website/ni_multisim/ni_multisim/settings/dev.py ]; then
		rm website/ni_multisim/ni_multisim/settings/dev.py
	fi
	mv website/ni_multisim/ni_multisim/settings/dev.py.bak website/ni_multisim/ni_multisim/settings/dev.py
fi

#execute git command with all parameters
echo "executing ${WHITE} ${BOLD}git $@${NC}"
git "$@"

#restore local settings file
echo "restoring local dev.py file"
./uselocaldev.sh

if [ $DEBUG = true ]; then
	echo "restoring ${GREEN}debug${NC}"
	./usedebug.sh
else
	if [ $RELEASE = true ]; then
		echo "restoring ${GREEN}release${NC}"
		./userelease.sh
	fi
fi
