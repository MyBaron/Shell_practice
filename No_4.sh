#!/bin/bash

#@author baron
#@data 2018-09-07
#@comtent check long-range server status




# while循环 循环获取用户输入Ip字段
# 用法：
# 1. 条件与If一样[] 里是判断条件
# 2. do done 里面是判断逻辑，do为开始，done为结束

network="${1}"
while [ "${network}" == "" ]
do
	read -p "please input what you want to check network ,format is x.x.x  "  network
done

read -p "please input what you want to start the number  " start 

read -p "please input what you want to end the number  " end 

# for循环遍历次数
# seq指令是从某个数到另外一个数之间的所有整数
# 用法
# 1. for xx in xx 
# do done 里面是判断逻辑，do为开始，done为结束
# 
# 2. 也可以 for ((i=1; i<=100; i ++))



for sitenu in $(seq "${start}" "${end}" )
do
	ping -c 1   "${network}.${sitenu}" &> /dev/null && result=0 || result=1
	
	if [ "${result}" == 0 ]; then
		echo "Server ${network}.${sitenu} is UP."
	else
		echo "Server ${network}.${sitenu} is DOWN."
	fi
done

echo "ok,that is checking over"
