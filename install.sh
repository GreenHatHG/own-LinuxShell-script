#!/bin/bash
MainPrint()
{
    echo "1-更新软件源  2-更换源为中科大源  3-安装软件工具  4-更新系统  5-arch一键安装脚本(by helmuthdu)"
    read Selection
    case ${Selection} in
        1)
            sudo pacman -Sy
            ;;
        2)
            UpdateMirror
            ;;
        3)
            InstallSoftware
            ;;
        4)
            sudo pacman -Syyu
            ;;
        5)
            wget https://git.io/vS1GH -O - | tar xz
            cd helmuthdu-aui-9253c5d && ./fifo
            ;;
    esac
}

InstallSoftware()
{
    echo "请选择要安装的软件"
    echo "1-浏览器系列"
    echo "2-编程开发"
    echo "3-github项目工具一键安装"
    echo "4-字体"
    echo "5-常用"
    read Selection
    case ${Selection} in
        1)
            InstallBrower
            ;;
        2)  
            InstallProgramAndEditTool
            ;;
        3)
            InstallGithubProject
            ;;
        4)
            InstallFonts
            ;;
        5)
            InstallDaily
            ;;
        esac
}

InstallBrower()
{
    clear
    echo "可一次性安装多个软件，每选择一个按一次回车，按0结束"
    echo "1-Chrome          google浏览器稳定版"
    echo "2-Chromium        google浏览器测试版"
    echo "3-Vivaldi         基于chrome，浏览器另一选择"
    echo "4-Firefox         火狐不解释"
    echo "5-Firefox汉化包    firefox-i18n-zh-cn"
    String="sudo pacman -S "
    Exit=0
    while read Selection
    do
        case ${Selection} in
            0)
                Exit=1
                break
                ;;
            1)
                Install="${String} google-chrome"
                ;;
            2) 
                Install="${String} chromium"
                ;;
            3) 
                Install="${String} vivaldi"
                ;;
            4) 
                Install="${String} firefox"
                ;;
            5)
                Install="${String} firefox-i18n-zh-cn"
                ;;
        esac
        if [ ${Exit} == 1 ]
        then
            break
        fi
        String=${Install}
    done
    ${String}
}

InstallProgramAndEditTool()
{
    clear
    echo "可一次性安装多个软件，每选择一个按一次回车，按0结束"
    echo "1-Pycharm                 Python编程用的专业IDE"
    echo "2-Qt-Creator              可当C/C++编译器或者开发应用程序"
    echo "3-VS-Code[ArchLinuxCN]    微软旗下编辑器"
    echo "4-Atom                    GitHub旗下编辑器"
    echo "5-Android-Studio          Android app开发"
    echo "6-Sublime-Text            性感无比的编辑器"
    echo "7-Genymotion              Android模拟器，快到极致"
    echo "8-Mysql-workbench         为SQL而设计"
    echo "9-Netbeans                兼容性强的java开发平台"
    echo "10-Code::Blocks           C/C++编译器"
    echo "11-Eclipse-JAVA           JAVA集成开发环境"
    echo "12-Intellij-idea          智能的JAVA开发平台"
    echo "13-vim                    编辑神器之一"
    echo "14-emacs                  编辑神器之一"
    echo "15-clion                  c/c++编译器，同idea一样智能"
    String="sudo pacman -S "
    Exit=0
    while read Selection
    do
        case ${Selection} in
            0)
                Exit=1
                break
                ;;
            1)
                Install="${String} pycharm"
                ;;
            2) 
                Install="${String} qtcreator"
                ;;
            3) 
                Install="${String} visual-studio-code-bin"
                ;;
            4) 
                Install="${String} atom"
                ;;
            5) 
                Install="${String} android-studio"
                ;;
            6) 
                Install="${String} sublime-text-dev-zh-cn"
                ;;
            7) 
                Install="${String} genymotion"
                ;;
            8) 
                Install="${String} mysql-workbench"
                ;;
            9) 
                Install="${String} netbeans"
                ;;
            10) 
                Install="${String} codeblocks"
                ;;
            11) 
                Install="${String} eclipse-java"
                ;;
            12) 
                Install="${String} intellij-idea-community-edition"
                ;;
            13) 
                Install="${String} vim"
                ;;
            14) 
                Install="${String} emacs"
                ;;
            15) 
                Install="${String} clion"
                ;;
        esac
        if [ ${Exit} == 1 ]
        then
            break
        fi
        String=${Install}
    done
    ${String}
}

InstallGithubProject()
{
    clear
    echo "1- ssr-helper"
    echo "2- zsh"
    echo "3- zsh powerlevel9k主题"
    echo "4- Vimix-gtk-theme"
    echo "5- numix-icon-theme-circle"
    echo "6- arc-theme"
    echo "7- zsh agnoster主题"
    echo "8- numix-gtk-theme"
    read Selection
    case ${Selection} in
    1)
        sudo pacman -S npm
        sudo npm install -g ssr-helper
        git clone -b manyuser https://github.com/shadowsocksr-backup/shadowsocksr.git
        ssr config ~/shadowsocksr
        ;;
    2)
        sudo pacman -S zsh
        echo "是否安装on-my-zsh?        Y/N?"      
        read s
        if [[ ${s} == Y || ${s} == y ]]
        then
            sudo pacman -S git
            wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh
            chmod +x install.sh
            ./install.sh
        fi
        ;;
     3)
         git clone https://github.com/bhilburn/powerlevel9k.git 
         mv powerlevel9k ~/.oh-my-zsh/custom/themes/
         newstr="ZSH_THEME=\"powerlevel9k/powerlevel9k\""
         sed -i '/ZSH_THEME/d' ~/.zshrc
         sed -i '9 aZSH_THEME=\"powerlevel9k/powerlevel9k\"' ~/.zshrc
         ;;
     4)
         sudo pacman -S gtk-engine-murrine gtk-engines
         git clone https://github.com/vinceliuice/vimix-gtk-themes.git
         cd vimix-gtk-themes && ./Vimix-installer
         ;;
     5)
         sudo pacman -S yaourt
         yaourt -S numix-icon-theme-git
         ;;
     6)
         sudo pacman -S yaourt
         yaourt -S arc-gtk-theme      
         ;; 
     7)
            cd ~ && find -name '.zshrc' | xargs perl -pi -e 's|robbyrussell|agnoster|g'
            wget https://raw.githubusercontent.com/powerline/powerline/develop/font/10-powerline-symbols.conf
            wget https://raw.githubusercontent.com/powerline/powerline/develop/font/PowerlineSymbols.otf
            sudo mkdir /usr/share/fonts/OTF
            sudo cp 10-powerline-symbols.conf /usr/share/fonts/OTF/ 
            sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
            sudo mv PowerlineSymbols.otf /usr/share/fonts/OTF/
            ;;
     8)
        sudo pacman -S numix-gtk-theme
        ;;
    esac
}

InstallFonts()
{
    clear
    echo "可一次性安装多个软件，每选择一个按一次回车，按0结束"
    echo "1-中文推荐：Dejavu和文泉驿-微米黑"
    echo "2-中文noto-fonts-cjk"
    echo "3-编程字体adobe-source-code-pro-fonts"
    String="sudo pacman -S "
    Exit=0
    while read Selection
    do
        case ${Selection} in
            0)
                Exit=1
                break
                ;;
            1)
                Install="${String} ttf-dejavu wqy-microhei"
                ;;
            2)
                Install="${String} noto-fonts-cjk"
                ;;  
            3)
                Install="${String} adobe-source-code-pro-fonts"
                ;; 
        esac
        if [ ${Exit} == 1 ]
        then
            break
        fi
        String=${Install}
    done
    ${String} 
}

InstallDaily()
{
    clear
    echo "可一次性安装多个软件，每选择一个按一次回车，按0结束"
    echo "1-fcitx搜狗输入法 "
    echo "2-网易云音乐"
    echo "3-Synapse快速启动软件"
    echo "4-wps[ArchLinuxCN]"
    echo "5-FileZilla FTP管理工具"
    echo "6-FoxitReader"
    String="sudo pacman -S "
    Exit=0
    while read Selection
    do
        case ${Selection} in
            0)
                Exit=1
                break
                ;;
            1)
                Install="${String} fcitx fcitx-gtk2 fcitx-gtk3 fcitx-qt4 fcitx-qt5 fcitx-configtool fcitx-sogoupinyin"
                str1="export GTK_IM_MODULE=fcitx"
                str2="export QT_IM_MODULE=fcitx"
                str3="export XMODIFIERS=\"@im=fcitx\""
                echo ${str1} >> ~/.xprofile
                echo ${str2} >> ~/.xprofile
                echo ${str3} >> ~/.xprofile
                ;;
            2)
                Install="${String} netease-cloud"
                ;;
            3)
                Install="${String} synapse"
                ;;
            4)
                Install="${String} wps-office"
                ;;
            5)  
                Install="${String} filezilla"
                ;;
            6)
                Install="${String} foxitreader"
                ;;
        esac
        if [ ${Exit} == 1 ]
        then
            break
        fi
        String=${Install}
    done
    ${String} 
}

UpdateMirror()
{

    echo "arch选1， manajro选2, 3-ArchLinuxCN"
    read s
    if [ ${s} == 2 ]
    then    
      echo "勾选 http://mirrors.ustc.edu.cn/manjaro/ ，然后按 OK 键两次。"
      sleep 0.5s
      sudo pacman-mirrors -i -c China -m rank
    elif [ ${s} == 1 ]
    then
      sudo sed -i "1iServer = https://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch" /etc/pacman.d/mirrorlist
    else
      str1="[archlinuxcn]"
      str2="Server = https://mirrors.ustc.edu.cn/archlinuxcn/'$'arch"
      sudo sh -c "echo ${str1} >> /etc/pacman.conf"
      sudo sh -c "echo ${str2} >> /etc/pacman.conf"
      sudo pacman -S archlinuxcn-keyring
      echo "写入完成"
    fi
}

MainPrint
