#!/bash/bin
# baron
# 2019-01-31
# 测试网络和系统信息


# tput 可以更改几项终端功能，如移动或更改光标、更改文本属性，以及清除终端屏幕的特定区域
# sgr0 表示清除所有更改的配置
reset=`tput sgr0`

# 查看是否可以联网
# \E[32m 是修改字体颜色，32m 是绿色
ping -c 1 www.baidu.com &> /dev/null && echo -e '\E[32m'"网络状态：${reset}可连接 " || echo -e '\E[32m'"网络状态：${reset}未连接"


# 查看系统类型
# mac系统并没有-o选项
os=`uname -o`
echo -e '\E[32m'"该系统类型是：${reset}$os"


# 系统的发行版本
REV=`uname -r`
# 系统的名称
OS=`uname -s`
# 系统类型
MACH=`uname -m`
echo -e '\E[32m'"系统的发行版本：${reset}$REV"
echo -e '\E[32m'"系统的名称：${reset}$OS"
echo -e '\E[32m'"系统的类型：${reset}$MACH"





