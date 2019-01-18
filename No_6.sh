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







