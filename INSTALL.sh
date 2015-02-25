#!/bin/bash
#201502110759
echo "*****************$(tput bold)Ubuntu Kernel Updater$(tput sgr0)****************
 $(tput bold)
                    ╔╦╗╔═╗╔╗╔╔═╗ ╦╦╔╦╗
                    ║║║╠═╣║║║║ ║ ║║ ║ 
                    ╩ ╩╩ ╩╝╚╝╚═╝╚╝╩ ╩
$(tput sgr0)
https://github.com/iitmanojit/ubuntu-kernel-updater/
Email: iitmanojit@gmail.com
Kernel Build: 3.18.7-031807 mainline (on 11-Feb-2015)
License: GNU GPL v2.0
********************************************************"
while true; do
	read -p "Are you sure you want to manually upgrade kernel to 3.18.5 (y/n)?" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes(y) or no(n).";;
    esac
done

#URL of kernel packages
url_headers_all="http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.18.7-vivid/linux-headers-3.18.7-031807_3.18.7-031807.201502110759_all.deb"
url_image_generic_i386="http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.18.7-vivid/linux-image-3.18.7-031807-generic_3.18.7-031807.201502110759_i386.deb"
url_headers_generic_i386="http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.18.7-vivid/linux-headers-3.18.7-031807-generic_3.18.7-031807.201502110759_i386.deb"
url_headers_generic_amd64="http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.18.7-vivid/linux-headers-3.18.7-031807-generic_3.18.7-031807.201502110759_amd64.deb"
url_image_generic_amd64="http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.18.7-vivid/linux-image-3.18.7-031807-generic_3.18.7-031807.201502110759_amd64.deb"


#install package based on architecture
u_arch=`uname -m`
if  [ $u_arch = "i686" -o $u_arch = "i386" ]; then
	mkdir -p $HOME/ubuntu-kernel-updater/kernel-i386 
	cd $HOME/ubuntu-kernel-updater/kernel-i386
	wget -c $url_headers_all
	wget -c $url_headers_generic_i386
	wget -c $url_image_generic_i386
	sudo dpkg -i *.deb  
	sudo rm -rf $HOME/ubuntu-kernel-updater/kernel-i386
elif [ $u_arch = "x86_64" ]; then
	mkdir -p $HOME/ubuntu-kernel-updater/kernel-amd64
	cd $HOME/ubuntu-kernel-updater/kernel-amd64
	wget -c $url_headers_all
	wget -c $url_headers_generic_amd64
	wget -c $url_image_generic_amd64
	sudo dpkg -i *.deb  
	sudo rm -rf $HOME/ubuntu-kernel-updater/kernel-amd64
else
        echo "Supported only for x86, and x86_64."
fi

echo "Thanks for using $(tput bold)ubuntu-kernel-updater$(tput sgr0)"
echo ""
