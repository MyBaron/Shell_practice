#!/bin/bash
#拷贝某文件到某个地方

#输入参数
# 执行该脚本命令 sh xx.sh hello
# hello 为输入的参数
# ${n} 为第n个传入参数 从1开始 0是文件名称
# $# 为传入参数的个数

file=${1}
path="/Users/baron/GitHub/Shell_practice"
echo "输入的file为${file}"
echo "输入的path为${path}"
echo "输入的参数个数为$#"


# if-elif-else 逻辑
# if判断语句在[] 里面
# 注意： [] 里面要有空格！！！！！！
# if 配合test语句使用 不需要[]

if [ "${file}" == "" ] && [ "${path}" == "" ]; then
	echo "file和path都不能为空"
elif test -e ${file} ; then
	echo "将${file}拷贝到${path}"
        cp -r -i ${file} ${path}
else 
	echo "file 文件不存在"
fi

exit 0
