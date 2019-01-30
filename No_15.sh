#!/bin/bash
# baron
# 2019-01-29
# 将这个脚本添加到环境的目录中，可以使用终端执行命令

function add(){
	# 获取当前路径
	wd=`pwd`
	echo "当前路径为$wd"
	## 将脚本名称写到临时文件temp
	## basename 是去掉路径，只剩下文本名称
	basename "$(test -L "$0" && readlink "$0" || echo "$0")" > temp
	echo "temp的内容 $(cat temp )"
	## 拼接脚本所在的路径
	scriptName=$(echo -e -n $wd/ && cat temp)
	echo "脚本所在的路径 $scriptName"
	# 将脚本添加到全局命令中
	su -c "cp $scriptName /usr/bin/scriptTest" root && echo "安装命令成功" || echo "安装命令失败"
	rm -f temp
	echo "现在可以在终端使用scriptTest命令"
}

function succ(){
	echo "使用命令成功"
}


while getopts ':i' name
do
	case $name in
	i)
		 add ;;
	*) 	
		succ ;;
	esac
done



exit 0
