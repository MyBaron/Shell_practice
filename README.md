# Shell_practice

## 本篇

- 练习Shell编程，以每个脚本为单位
- 不定期更新
- 目前脚本数量为10个
- 更新时间2019-01-24
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
## No.4 批量检查ip地址是否被占用

> 功能：批量检查ip地址是否被占用
> 练习内容
> 1. while循环
> 2. for 循环
> 3. seq 指令 用于产生从某个数到另外一个数之间的所有整数

``` shell
#!/bin/bash

#@author baron
#@data 2018-09-07
#@comtent check long-range server status

network="${1}"

# while循环 循环获取用户输入Ip字段
# 用法：
# 1. 条件与If一样[] 里是判断条件
# 2. do done 里面是判断逻辑，do为开始，done为结束


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
exit 0 

```

## No.5 检查端口情况

> 功能：检查端口情况
> 练习内容
> 1. 输入流
> 2. if 判断条件
> 3. grep 信息筛选


``` shell
#!/bin/bash
#@author baron
#@data 2018-09-06
#@content check any port is been taken

echo "Now , I will detect your Linux server's services!"
if [ "${1}" != "" ]; then
        echo "The www,ftp,ssh,mail(stmp),and you want to check ${1} will be detected! \n"
else
        echo "The www,ftp,ssh,mail(stmp) will be detected! \n"
fi
# 设定输出路径
testfile=checkPortResult.txt


# 将netstat结果输出到文件
# > 为输入重定向 例如 xx0 > xx1.txt 意思是将xx0的内容输入到xx1.txt中

netstat -tuln > ${testfile}


# 检测各个端口情况
# 利用grep 检索关键字

esting=$(grep ":80" ${testfile})
if [ "${testing}" != ""  ]; then
        echo "WWW is running in your system"
fi

testing=$(grep ":22" ${testfile})
if [ "${testing}" != ""  ]; then
        echo "SSH is running in your system"
fi

testing=$(grep ":21" ${testfile})
if [ "${testing}" != ""  ]; then
        echo "FTP is running in your system"
fi

testing=$(grep ":25" ${testfile})
if [ "${testing}" != ""  ]; then
        echo "Mail is running in your system"
fi

if [ "${1}" != "" ]; then
        testing=$(grep ":${1}" ${testfile})
        if [ "${testing}" != ""  ]; then
                echo "${1} port is running in your system"
        fi
fi

echo "check is over , thank you"
exit 0
        
```
## No.6 检查CPU情况

> 功能：检查CPU情况
> 效果图

![效果图 .png](https://upload-images.jianshu.io/upload_images/6212571-1a140c975b22a0e6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


``` shell
#!/bin/bash
# baron
# 2019-01-18
# 分析cpu使用情况
# 利用vmstat 分析cpu使用情况


# 检测是否有vmstat命令
if  ! which vmstat &> /dev/null ; then
        echo "the sy is no vmstat commam"
        exit 1
fi

# 创建临时文件
date=$(date "+%Y-%m-%d_%H:%M:%S")
file="cpu_stat_${date}.txt"
echo "正在收集cpu情况，请等候"
vmstat 2 3 >${file}

# 睡眠三秒
sleep 3s
set US
set SY
R=0

# 循环处理数据
for NR in $(seq 3 5)
do
        US1=$(vmstat |awk 'NR==3{print $13}')
        SY1=$(vmstat |awk 'NR==3{print $14}')
        R1=$(vmstat |awk 'NR==3{print $1}')
        if [ $R1 -gt $R ]; then
                R=${R1}
        fi
        US=`expr ${US} + ${US1} `
        SY=`expr ${SY} + ${SY1} `
done

# 删除临时文件
rm -r ${file}
US=`expr ${US} / 3 `
SY=`expr ${SY} / 3 `

echo "最大的进程数是：${R}"
echo "平均的CPU占用率是：`expr ${US} + ${SY}`%"
echo "用户平均CPU占用率：${US}%"
echo "系统平均CPU占用率：${SY}%"

echo "this is all"
exit 0

```

## No.7 检查内存情况
> 功能：检查CPU情况
> 使用free 命令获取内存情况

> 效果图

![image.png](https://upload-images.jianshu.io/upload_images/6212571-ce8bd1c679c8f38c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


``` shell
#!/bin/bash
# baron
# 2019-01-21
# 分析内存使用情况
# 利用free 分析内存使用情况

# 检测是否有free命令
if  ! which free &> /dev/null ; then
        echo "the sy is no free commam"
        exit 1
fi

echo "正在检查内存使用情况"

TOTAL=$(free -m |awk '/Mem/{print $2}')
USE=$(free -m |awk '/Mem/{print $3}')
FREE=$(free -m |awk '/Mem/{print $4}')
CACHE=$(free -m |awk '/Mem/{print $6}')

echo -e  "当前使用情况： \n内存总大小：${TOTAL}M \n内存使用量：${USE}M \n可用剩余：${FREE}M\n磁盘缓存大小：${CACHE}M"

exit 0
```


## No.8 获取IP地址（简陋版）
> 获取当前Ip地址

``` shell

#!/bash/bin
# baron
# 2019-01-22
# 获取IP地址 (简陋版)

# 检测是否有ifconfig命令
if  ! which ifconfig &> /dev/null ; then
        echo "the sy is no ifconfig commam"
        exit 1
fi

IP=$(ifconfig |head -n2|grep mask|awk '{print $2}')
echo "当前的IP：$IP"

```

## No.9 trap捕获信号
> 对trap指令进行运用

``` shell
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
```
## No.10 数组和函数
> 对数组和函数的练习

> 效果图

``` linux
开始执行fun函数,将返回输入的数中大于10的数的数组
数组的个数为6
输入数组的值为1 2 3 33 44 55 66
大于10的数有 33 44 55 66
```


``` shell
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
                        # 同样可以这样写 number=`expr $number + 1`
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
```
