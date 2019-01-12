#!/bin/bash
#2018-09-04 baron
# 练习一：
# echo 输出变量
# read 读取输入
# $ 的使用
#--------------------------------------------

# $ 是代表变量替换
# 输出PATH变量
echo $PATH
# echo -e 是会对\n \a 等这些字符处理
echo  '\n Hello World! baron \a \n'

# 定义一个变量
name='helloName'
# '' 和"" 的区别就是 "" 会识别$符号
echo  "输出name变量的值：${name}"
echo  '单引号是不会识别$的：${name}'

# read 输入 输入的值赋值到fistname这个变量中 -p 是提示
read -p "please enter your firstname "  firstname
read -p "and then please enter your lastname " lastname

echo "just a minute..........."
# 引用变量
echo "your name is" ${firstname}${lastname}
# $() 是使用命令，这里是使用了data命令输出日志
echo "Hellp ${firstname}${lastname} today is $(date +%Y%m%d) " 
exit 0
