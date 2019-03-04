#!/bin/bash

compiler_dir=/usr/bin

echo '-------------Old compiler versions:-------------'
gcc --version | head -1
g++ --version | head -1
gfortran --version | head -1
echo '------------------------------------------------'
echo 

#expect "password:"
#send '523timo'
echo '523timo' | sudo -S touch /tmp/tmp.tmp

if [ -n "$1" ]
then 
	sudo rm $compiler_dir/gcc
	sudo rm $compiler_dir/gfortran
	sudo rm $compiler_dir/g++

	if [ $1 = 5 ]
	then
		sudo ln -s $compiler_dir/gcc-5 $compiler_dir/gcc
		sudo ln -s $compiler_dir/gfortran-5 $compiler_dir/gfortran
		sudo ln -s $compiler_dir/g++-5 $compiler_dir/g++
	elif [ $1 == 4.4 ]
	then
		sudo ln -s $compiler_dir/gcc-4.4 $compiler_dir/gcc
		sudo ln -s $compiler_dir/gfortran-4.4 $compiler_dir/gfortran
		sudo ln -s $compiler_dir/g++-4.4 $compiler_dir/g++
	elif [ $1 == 4.8 ]
	then
		sudo ln -s $compiler_dir/gcc-4.8 $compiler_dir/gcc
		sudo ln -s $compiler_dir/gfortran-4.8 $compiler_dir/gfortran
		sudo ln -s $compiler_dir/g++-4.8 $compiler_dir/g++
	else
		echo ' Unrecongnized compiler version, only support 4.4, 4.8 and 5'
	fi
else 
	echo ' Usage: complile 4.4 or 4.8 or 5  '
	echo '' 
fi

echo '-------------New compiler versions:-------------'
gcc --version | head -1
g++ --version | head -1
gfortran --version | head -1
echo '------------------------------------------------'
echo 
