if [ -h website/ni_multisim/static/multisim ]; then
        rm website/ni_multisim/static/multisim
else 
	if [ -d website/ni_multisim/static/multisim ]; then
        	mv website/ni_multisim/static/multisim website/ni_multisim/static/multisim.bak
	fi
fi

ln -s /home/rodney/prj/webmultisim/multisim/dist/release/ website/ni_multisim/static/multisim

