#!/bin/bash
# baron
# 2019-01-26
# 练习函数传递数组

function fun(){
	local sum=0
	local newarray
	#接收参数
	newarray=(`echo "$@"`)
	#遍历数组中的每一个数
	for num in ${newarray[*]}
	do
		sum=$[ $sum + $num  ]
	done
	echo $sum

}

array=(1 2 3 4 5 6 )
echo "输入的数组是 ${array[*]}"
arg1=`echo ${array[*]}`
result=`fun $arg1`
echo "数组累加的结果是：$result"

