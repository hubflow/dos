#!/usr/bin/env bash

echo "Intalling Dependencies   ..."
echo "sudo apt install trash-cli"
sudo apt install trash-cli
echo "sudo apt install python3-apt"
sudo apt install python3-apt
echo "fonts-firacode begins" 
#https://github.com/tonsky/FiraCode/wiki/Linux-instructions#manual-installation


fonts_dir="${HOME}/.local/share/fonts"
if [ ! -d "${fonts_dir}" ]; then
    echo "mkdir -p $fonts_dir"
    mkdir -p "${fonts_dir}"
else
    echo "Found fonts dir $fonts_dir"
fi

for type in Bold Light Medium Regular Retina; do
    file_path="${HOME}/.local/share/fonts/FiraCode-${type}.ttf"
    file_url="https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-${type}.ttf?raw=true"
    if [ ! -e "${file_path}" ]; then
        echo "wget -O $file_path $file_url"
        wget -O "${file_path}" "${file_url}"
    else
	echo "Found existing file $file_path"
    fi;
done

echo "fc-cache -f"
fc-cache -f

echo "fonts-firacode ends..."


echo "Intalling Dependencies   ... Done"