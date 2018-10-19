#!/bin/bash
MainPrint()
{
    echo "此脚本用于斐讯n1-armbian5.62，其他apt包管理器版本自测"
    echo "安装前记得更新源"
    echo "更新软件源"
    echo "1-更新软件源"
    echo "2-安装create_ap以便开启WiFi热点"
    read Selection
    case ${Selection} in
    1)
        sudo apt-get update;;
    2)
        create_ap;;
    esac    
}

create_ap()
{
    #参考：http://www.right.com.cn/forum/forum.php?mod=viewthread&tid=341724
    sudo systemctl stop systemd-resolved
    sudo systemctl disable systemd-resolved
    echo "关掉系统自带的 systemd-resolved 服务"
    echo "接着安装dnsmasq"
    sduo apt install dnsmasq -y
    echo "下载create_ap工具"
    git clone https://github.com/oblique/create_ap
    cd create_ap/
    make install
}

MainPrint
