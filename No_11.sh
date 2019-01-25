#!/bin/bash
# baron
# 2019-01-25
# 联系函数的return

function fun1(){
	 echo "此函数是返回一个数值"
	 return  200
}


# 直接调用函数，使用$?获取返回值
fun1
# $? 上个命令的退出状态，或函数的返回值
echo "用\$?接收的返回值是： $?"

# 将函数赋值给变量
# 用变量来接收返回值
arg=$(fun1)
#这里调用变量arg，相当于执行了函数fun1
echo "变量：$arg"
#这里返回值是0，是因为这里的命令值的是echo，而不是$arg的函数命令
echo "命令返回值是：$?"






