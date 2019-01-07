#!/bin/sh

echo "*********************************"
sudo echo "选择安装系统："
echo "  14.04 请输入 1"
echo "  16.04 请输入 2"
echo "  18.04 请输入 3"
echo "*********************************"
read SystemIndex

if [ -z $SystemIndex ];then
    echo "输入格式错误"
    exit
 else
    index=`echo "$SystemIndex*1" | bc `
   if [ $index -eq 1 ];then
       System=14.04
   elif [ $index -eq 2 ];then
       System=16.04   
   elif [ $index -eq 3 ];then  
       System=18.04 
    fi
fi

echo "*********************************"
echo "选择更新源："
echo "  阿里源请输入 1"
echo "  清华源请输入 2"
echo "  网易源请输入 3"
echo "*********************************"
read SourceIndex

if [ -z $SystemIndex ];then
    echo "输入格式错误"
    exit
 else
    index=`echo "$SourceIndex*1" | bc `
   if [ $index -eq 1 ];then
	echo 1111
       Source=ali
   elif [ $index -eq 2 ];then
	echo 222
       Source=qinghua   
   elif [ $index -eq 3 ];then  
       Source=163 
    fi
fi
echo $Source
filename="source_${Source}_ubuntu${System}.list"

#下载安装git
echo "开始下载安装git..."
sudo apt-get install git
sudo apt-get -f install
sudo apt-get install git
echo "安装完成"
echo "开始下载库文件..."
git clone https://github.com/quanweiGithub/Ubuntu-China-Source
cd Ubuntu-China-Source
ls
echo "备份原链接..."
sudo cp /etc/apt/sources.list /etc/apt/sources_init.list
echo "设置链接..."
sudo cp $filename /etc/apt/sources.list
echo "更新源..."
sudo apt-get update
echo "修复软件..."
sudo apt-get -f install
echo "更新软件..."
sudo apt-get upgrade
echo "清理文件..."
cd ..
sudo rm -rf Ubuntu-China-Source
echo "国内源清理完毕"

