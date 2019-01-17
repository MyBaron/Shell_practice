#!/bin/bash
#@author baron
#@data 2018-09-06
#@content check any port is been taken

echo "Now , I will detect your Linux server's services!"
if [ "${1}" != "" ]; then
	echo "The www,ftp,ssh,mail(stmp),and you want to check ${1} will be detected! \n"
else 
	echo "The www,ftp,ssh,mail(stmp) will be detected! \n"
fi
# 设定输出路径
testfile=checkPortResult.txt


# 将netstat结果输出到文件
# > 为输入重定向 例如 xx0 > xx1.txt 意思是将xx0的内容输入到xx1.txt中

netstat -tuln > ${testfile}


# 检测各个端口情况
# 利用grep 检索关键字

testing=$(grep ":80" ${testfile})
if [ "${testing}" != ""  ]; then
	echo "WWW is running in your system"
fi

testing=$(grep ":22" ${testfile})
if [ "${testing}" != ""  ]; then
	echo "SSH is running in your system"
fi

testing=$(grep ":21" ${testfile})
if [ "${testing}" != ""  ]; then
	echo "FTP is running in your system"
fi

testing=$(grep ":25" ${testfile})
if [ "${testing}" != ""  ]; then
	echo "Mail is running in your system"
fi

if [ "${1}" != "" ]; then
	testing=$(grep ":${1}" ${testfile})
	if [ "${testing}" != ""  ]; then
		echo "${1} port is running in your system"
	fi
fi

echo "check is over , thank you"
exit 0
