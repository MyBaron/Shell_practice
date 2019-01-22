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
