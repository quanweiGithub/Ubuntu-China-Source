#!/bin/sh

main () {


    sudo echo ""


    # * ---------------------------------------------------------------- const


    ver_14=14.04
    ver_16=16.04
    ver_18=18.04

    src_ali=ali
    src_thu=thu
    src_163=163

    ver_choice=$1
    src_choice=$2


    # * ---------------------------------------------------------------- manual config


    # * ---------------- version

    if [ -z "$ver_choice" ]; then

        echo "*********************************"
        echo "选择安装系统："
        echo "  14.04 请输入 14"
        echo "  16.04 请输入 16"
        echo "  18.04 请输入 18"
        echo "*********************************"
        read VersionChoice

        ver_choice=`echo "$VersionChoice*1" | bc `

    fi

    if [ $ver_choice -eq 14 ]; then
        ver_choice=$ver_14
    elif [ $ver_choice -eq 16 ]; then
        ver_choice=$ver_16
    elif [ $ver_choice -eq 18 ]; then
        ver_choice=$ver_18
    else
        echo "输入格式错误"
        exit
    fi

    echo "要安装的系统版本："$ver_choice


    # * ---------------- source

    if [ -z "$src_choice" ]; then
        echo "*********************************"
        echo "选择更新源："
        echo "  阿里源请输入 ali"
        echo "  清华源请输入 thu"
        echo "  网易源请输入 163"
        echo "*********************************"
        read SourceChoice
        src_choice=`echo "$SourceChoice*1" | bc `
    fi

    if [ $src_choice = 'ali' ]; then
        :
    elif [ $src_choice = 'thu' ]; then
        :
    elif [ $src_choice = '163' ]; then
        :
    else
        echo "输入格式错误"
        # exit
    fi

    echo "目标源："$src_choice


    # * ---------------------------------------------------------------- delay

    echo -n 'Will start at... '
    echo -n '3 '
    sleep 1s
    echo -n '2 '
    sleep 1s
    echo -n '1 '
    sleep 1s
    echo ''

    # * ---------------------------------------------------------------- apply

    echo "安装 git..."
    sudo apt-get -y install git
    sudo apt-get -f install
    sudo apt-get -y install git

    echo "下载源列表..."
    # git clone https://github.com/quanweiGithub/Ubuntu-China-Source
    git clone https://github.com/seognil-forker/Ubuntu-China-Source
    cd Ubuntu-China-Source
    ls

    echo "备份原始列表："
    echo "/etc/apt/sources.list -> /etc/apt/sources.list.bak"
    sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak

    echo "替换为国内源..."
    filename="source_${src_choice}_ubuntu_${ver_choice}.list"
    sudo cp $filename /etc/apt/sources.list

    # 这一步是否应该作为可选？
    # echo "更新系统"
    # sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y
    # sudo apt-get -f install
    # sudo apt-get autoremove -y && sudo apt-get clean -y

    echo "清理本程序"
    cd ..
    sudo rm -rf Ubuntu-China-Source
    echo "完成"
}

main "$@"