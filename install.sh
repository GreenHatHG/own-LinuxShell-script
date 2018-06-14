#!/bin/bash
MainPrint()
{
    echo "1-更新软件源  2-更换源为中科大源  3-安装软件  4-更新系统  5-arch一键安装脚本(by helmuthdu)"
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
    read Selection
    case ${Selection} in
        1)
            InstallBrower
            ;;
        2)  
            InstallProgramAndEditTool
            ;;
        3)
            InstallGithub
            ;;
        esac

}

InstallBrower()
{
    clear#!/bin/bash
MainPrint()
{
    echo "1-更新软件源  2-更换源为中科大源  3-安装软件  4-更新系统  5-arch一键安装脚本(by helmuthdu)"
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
        esac

}

InstallBrower()
{
    clear
    echo "可一次性安装多个软件，每选择一个按一次回车，按0结束"
    echo "1-Chrome      google浏览器稳定版"
    echo "2-Chromium    google浏览器测试版"
    echo "3-Vivaldi     基于chrome，浏览器另一选择"
    echo "4-Firefox     火狐不解释"
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
    echo "3-Visual-Studio-Code      微软旗下编辑器"
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
        if [ ${s} == Y ]
        then
            sudo pacman -S git
            wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh
            chmod +x install.sh
            ./install.sh
            clear
            echo "是否更改主题为agnoster        Y/N"
            read s1
            if [ ${s1} == Y || ${s1} == y ]
            then
            find -name 'pom.xml' | xargs perl -pi -e 's|robbyrussell|agnoster|g'
            wget https://raw.githubusercontent.com/powerline/powerline/develop/font/10-powerline-symbols.conf
            wget https://raw.githubusercontent.com/powerline/powerline/develop/font/PowerlineSymbols.otf
            cd /usr/share/fonts && sudo mkdir OTF
            sudo cp 10-powerline-symbols.conf /usr/share/fonts/OTF/ 
            sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
            sudo mv PowerlineSymbols.otf /usr/share/fonts/OTF/
            fi
        fi
       ;;
     3)
         git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/
         BeFound="ZSH_THEME="
         newstr="ZSH_THEME="powerlevel9k/powerlevel9k""
         filename=~/.zshrc
         line=`sed -n '/$BeFound/=' $filename`
         sed -i "$line d" $filename
         sed -i "$line i$newstr" $filename
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
    esac
}
UpdateMirror()
{
    echo "勾选 http://mirrors.ustc.edu.cn/manjaro/ ，然后按 OK 键两次。"
    sleep 0.5s
    sudo pacman-mirrors -i -c China -m rank
    clear
    echo "是否安装Archlinux CN    Y/N"
    read s
    if [ ${s} == Y || ${s} == y ]
    then
      str1="[archlinuxcn]"
      str2="Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch"
      sudo echo ${st1} >> /etc/pacman.conf
      sudo echo ${st2} >> /etc/pacman.conf
      echo "写入完成"
    fi
}

MainPrint
    echo "可一次性安装多个软件，每选择一个按一次回车，按0结束"
    echo "1-Chrome      google浏览器稳定版"
    echo "2-Chromium    google浏览器测试版"
    echo "3-Vivaldi     基于chrome，浏览器另一选择"
    echo "4-Firefox     火狐不解释"
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
    echo "3-Visual-Studio-Code      微软旗下编辑器"
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
        esac
        if [ ${Exit} == 1 ]
        then
            break
        fi
        String=${Install}
    done
    ${String}
}

InstallGithub()
{
    clear
    echo "1- ssr-helper"
    echo "2- zsh"
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
        if [ ${s} == Y ]
        then
            sudo pacman -S git
            wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh
            chmod +x install.sh
            ./install.sh
        fi
    esac
}
UpdateMirror()
{
    echo "勾选 http://mirrors.ustc.edu.cn/manjaro/ ，然后按 OK 键两次。"
    sleep 0.5s
    sudo pacman-mirrors -i -c China -m rank
}

MainPrint
