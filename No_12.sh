#!/bin/bash
# baorn	
# 2019-01-26
# awk 将输出所有分割的字符串

# 将echo的以空格切割然后遍历输出
# NF是awk的参数，代表切割后个数
# print $i 是输出切割后的第几列 $0是整行
val=`echo "第一 第二 第三 第四"|awk '{for(i=1;i<=NF;i++){print $i}}'`
echo $val
