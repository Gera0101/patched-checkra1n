#!/bin/bash
patchexec=$(which bspatch)

echo "make sure to be connected to the internet!"
sleep 3

rm -rf ~/Downloads/checkra1n_patch/

function main() {
	echo "Downloading patches"
	git clone https://github.com/Exploite-d/checkra1n_patch_A10_A11.git ~/Downloads/checkra1n_patch/ > /dev/null 2>&1
	echo -n "Enter checkra1n executable path: "
	read checkra1n_path
	if test -f "~/Downloads"; then
		echo ""
	else
		mkdir ~/Downloads
	fi
	mkdir ~/Downloads/checkra1n_patch
	cp $checkra1n_path ~/Downloads/checkra1n_patch/
	echo "Applying patches"
	$patchexec ~/Downloads/checkra1n_patch/checkra1n ~/Downloads/checkra1n_patch/checkra1n_patched ~/Downloads/checkra1n_patch/checkra1n_A10_A11_linux.patch
	echo "Moving checkra1n to folder"
	mkdir ~/Downloads/checkra1n_patched
	mv ~/Downloads/checkra1n_patch/checkra1n_patched ~/Downloads/checkra1n_patched/
	chmod +x ~/Downloads/checkra1n_patched/checkra1n_patched
	echo "checkra1n patched location: ~/Downloads/checkra1n_patched/checkra1n_patched"
	echo "Patched successfully!"
	echo "now run   ~/Downloads/checkra1n_patched/checkra1n_patched -c   on terminal, if there are any errors please let @plzdonthaxme know"
	rm -rf ~/Downloads/checkra1n_patch/
	exit
}

if test -f "$patchexec"; then
	main
else
	echo "Installing bspatch"
	if test -f "$(which apt-get)"; then
		sudo $(which apt-get) install bspatch > /dev/null
		if [ $? -eq 0 ]; then
			main
		else
			echo "contact @plzdonthaxme, your system cannot install bspatch"
		fi
	else
		echo "your linux type is not supported yet, contact @plzdonthaxme for instructions"
	fi
	
fi