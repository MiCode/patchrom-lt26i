#!/bin/bash

function usage {
	echo " USAGE: $1 input_target_files_zip [output_image_zip]"
	echo
	exit 1
}

function clean_up {
	if [ -d "$tmp_dir" ] 
	then
		rm -rf $tmp_dir
	fi
}

function error {
	echo "ERROR: $1 !!!"
	clean_up
	exit 1
}

function check_error {
	if [ $? -ne 0 ]
	then
		echo "ERROR: $1 !!!"
		clean_up
		exit 1
	fi
}

if [ $# -eq 1 ]
then
	zipfile=$1
	image_zip=${zipfile/.zip/.image.zip}
elif [ $# -eq 2 ]
then
	zipfile=$1
	image_zip=$2
else
	usage ${0##*/}
fi

if [ ! -f $zipfile ]
then
	error "$zipfile doesn't exist"
fi

system_size=1024000000
data_size=2048000000

tools_dir=${0%/*}
tmp_dir=$(mktemp -d .tmp.XXX)
tmp_img_dir=$tmp_dir/img
tmp_zip_dir=$tmp_dir/zip

mkdir -p $tmp_img_dir $tmp_zip_dir
unzip -q -d $tmp_zip_dir $zipfile

if [[ ! -d $tmp_zip_dir/SYSTEM &&  ! -d $tmp_zip_dir/DATA ]] 
then
	error "no SYSTEM or DATA directory in $zipfile"
fi

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "**********create image zip file***********"
echo
if [ -d $tmp_zip_dir/SYSTEM ]
then
	echo "**********create system.img***************"
	$tools_dir/make_ext4fs -s -l $system_size -a system $tmp_img_dir/system.img $tmp_zip_dir/SYSTEM
	check_error "create system.img failed"
fi

if [ -d $tmp_zip_dir/DATA ]
then
	echo "**********create data.img*****************"
	$tools_dir/make_ext4fs -s -l $data_size -a data $tmp_img_dir/data.img $tmp_zip_dir/DATA
	check_error "create data.img failed"
fi

cp $tools_dir/flash_tools/* $tmp_img_dir

rm -rf $image_zip

old_dir=$(pwd)
cd $tmp_img_dir
zip -r -y -q image.zip .
cd $old_dir
mv $tmp_img_dir/image.zip $image_zip
echo 
echo "create images zip $image_zip done !"
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
clean_up
