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

