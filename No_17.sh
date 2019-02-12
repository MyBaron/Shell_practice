#!/bin/bash
# baron
# 2019-02-12
# 查看系统网络

reset=`tput sgr0`

# 获取本地Ip
internalip=`hostname -I`
echo -e '\E[32m' "本地ip地址："${reset} ${internalip}

# 获取外网Ip
externalip=`curl -s ipecho.net/plain`
echo -e '\E[32m' "外网ip地址：" ${reset} $externalip

# 定义DNS服务器的IP地址
# sed '1 d' 代表删除第一行
nameservers=$(cat /etc/resolv.conf | sed '1 d' | awk '{print $2}' )
# 也可以用awd 的NR 来实现sed的效果
nameservers1=$(cat /etc/resolv.conf | awk 'NR>1{print $2}' )
echo -e '\E[32m' "DNS地址：" ${reset} ${nameservers}
