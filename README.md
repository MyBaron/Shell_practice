# Shell_practice

## 本篇

- 练习Shell编程，以每个脚本为单位
- 不定期更新
- 更新时间2019-01-12
- 项目已放到[github](https://github.com/MyBaron/Shell_practice),希望可以被start


## NO.1

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


