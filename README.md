# Shell_practice

## 本篇

- 练习Shell编程，以每个脚本为单位
- 不定期更新
- 更新时间2019-01-15
- 项目已放到[github](https://github.com/MyBaron/Shell_practice),希望可以被start


## NO.1 echo 和read

> 这次主要玩一下echo 和read
> echo 输出内容
> read 输入内容
> $ 的使用

```shell
#!/bin/bash
#2018-09-04 baron
#gitbuh: https://github.com/MyBaron/Shell_practice
# 练习一：
# echo 输出内容
# read 读取输入
# $ 的使用
#--------------------------------------------

# $ 是代表变量替换
# 输出PATH变量
echo $PATH
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
# 引用变量 输出自己输入的内容
echo "your name is" ${firstname}${lastname}
# $() 是使用命令，这里是使用了data命令输出日志
echo "Hellp ${firstname}${lastname} today is $(date +%Y%m%d) "
exit 0
```

## NO.2 检查一下文件是否存在

> 功能：检查一下文件是否存在
> 练习内容：
> 1. echo 内容输出
> 2. read 内容输入
> 3. test 检查条件
> 4. 命令使用

```shell

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
```

## NO.3 文件拷贝到指定目录下

> 将文件拷贝到指定目录下
> 练习内容
> 1. 输入参数
> 2. 逻辑判断 If-elif-else

``` shell
#!/bin/bash
#2018-09-015 baron
#github: https://github.com/MyBaron/Shell_practice
#将文件拷贝到指定目录下

#输入参数
# 执行该脚本命令 sh xx.sh hello.sh /baron/path
# hello 为输入的参数
# ${n} 为第n个传入参数 从1开始 0是文件名称
# $# 为传入参数的个数

file=${1}
path=${2}
echo "输入的file为${file}"
echo "输入的path为${path}"
echo "输入的参数个数为$#"


# if-elif-else 逻辑"
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


```
