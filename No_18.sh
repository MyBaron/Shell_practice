#!/bash/bin
# baron
# 2019-02-13
# 自动提交到远程代码库

# 检查当前路径是否有.git文件夹
function judge(){
	if [  -x ".git" ];then
		# 获取当前文件的名称
		if [ -f  ".gitignore"  ];then
			echo "添加忽略提交该脚本到远程代码库"
			echo "当前脚本名称${0}"
			echo ${0} >> .gitignore
			push
		else 
			echo "创建 .gitignore文件"
			echo "当前脚本名称${0}"
			touch .gitignore
			echo ${0} >> .gitignore
			push		
		fi
	
	else
		echo ".git文件夹不存在，请将该脚本放到与.git文件夹同一级中"
		exit -1
	fi
}
function push(){
	git add .
	git commit -m "$(date +%Y-%m-%d)"
	git push origin 
}
judge
echo "提交完毕"
exit 0



