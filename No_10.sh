#!/bin/bash
# baron
# 2019-01-24
# 练习函数和数组
# 
# 个人觉得数组操作是非常难用，而且功能点很少，在日常中应该避免使用数组
# 在使用数组中，经常利用到echo来构成数组

function fun(){
	echo "开始执行fun函数,将返回输入的数中大于10的数的数组"
	# 新建一个数组，用于返回
	local newarray
	local elements
	local oldarray
	local number=0
	#获取输入的参数
	elements=$[ $# -1 ]
	echo "数组的个数为${elements}"
	# $@相当于获取所有的参数，利用echo，相当于输入参数，()是组成数组
	oldarray=(`echo "$@"`)
	echo "输入数组的值为${oldarray[*]}"
	for (( i=0; i<=${elements}; i++ )){
		if [ $[${oldarray[$i]}] -gt 10  ]; then
			newarray[${number}]=${oldarray[$i]}
			# number=`expr $number + 1`
			number=$[ $number + 1 ]
		fi
	}
	echo "大于10的数有 ${newarray[*]}"
}
testArray=(1 2 3 33 44 55 66)
# 此处echo就是相当于输入数组的值作为参数，每一个值当做一个参数
# 如果只传入数组，只能当做是一个参数
arg1=$(echo ${testArray[*]} )
fun $arg1


