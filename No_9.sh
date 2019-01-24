#!/bin/bash
# baron
# 2019-01-23
# trap的使用 捕获信号
# trap commands signals : commands 捕获后触发的命令，signals 需要捕获的命令

echo "无法通过ctrl-c 来终止这个脚本,此脚本会运行10秒"
# SIGINT 是终止线程  SIGTERM 是尽可能终止进程
trap "echo '我已经告诉过你，你无法终止这个脚本'" SIGINT SIGTERM

count=1

while [ $count -lt 10 ]
do
	echo "第${count}秒"
	sleep 1
	count=$[ $count + 1 ]

done
# 捕获程序退出指令
trap "echo \"脚本运行结束,运行时间${count}秒\" " EXIT 

