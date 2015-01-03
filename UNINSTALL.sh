#!/bin/bash
#uninstalling the installed kernel 3.18.1
sudo apt-get purge linux-image-3.18.1*
sudo update-grub
