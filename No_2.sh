#!/bin/bash
#2018-09-14 baron
#github: https://github.com/MyBaron/Shell_practice

# 文件测试
# test 命令 -e 是如果文件存在则为真
# && ，com1 && com2,只有当com1 为true时，才会执行com2
# || ，与&& 相反 只有com1 为false时，才会执行com2

echo "the bash is check one file is exist or not \n"
read -p "请输入你想检查的文件 " file
test -e ${file} && echo "${file}文件存在" || echo "${file}文件不存在"

# 数值比较
# -lt 是小于的意思

num1=100
num2=200
echo "\nnum1=100,num2=200"
test ${num1} -lt ${num2} && echo "num1小于num2" || echo "num1大于num2" 

# 字符串
str1="str"
str2="str"
echo "\nstr1=str,str2=str"
test ${str1}=${str2} && echo "相等" || echo "不相等"
exit 0 
