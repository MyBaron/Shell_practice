#!/bin/bash
# baron
# 2019-01-28
# getopts接收输入参数


# getopts的命令格式：
# getopts optstring name [arg...]     例如:getopts "a:fs" OPTION
# getopts 作用就是接收用户在运行脚本的时候输入的参数，例如sh xx.sh -i
# getopts 通常用while来循环处理，用Case去得到不同的命令处理方式

# 在这里，接收处理的参数是i v h 三个参数
# 设置的格式是':i:vh'
# 第一个: 代表去掉系统的告警信息
# i: 是指接收i的指令，这个指令还有value，可以用$OPTARG来接收这个value
# v和h：就是单单是指令

while getopts ':i:vh' name
do
        case $name in
          i)
		echo "你输入的参数是i,值是$OPTARG";;
          v)
		echo "你输入的参数是v";;
          h)
		echo "你输入的参数是h";;
         *)
		echo "你输入的参数没有找到匹配";;
        esac
done

