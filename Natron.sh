#!/usr/bin/env bash

# Natron Installer - v1 Beta - Installer Shell Script for Ubuntu 22.04 LTS
# By SuperK2 - superk2_cu@protonmail.com

# función de colores en el texto del terminal texto
txtund=$(tput sgr 0 1)    # Underline
txtbld=$(tput bold)       # Bold
txtred=$(tput setaf 1)    # Red
txtgrn=$(tput setaf 2)    # Green
txtylw=$(tput setaf 3)    # Yellow
txtblu=$(tput setaf 4)    # Blue
txtpur=$(tput setaf 5)    # Purple
txtcyn=$(tput setaf 6)    # Cyan
txtwht=$(tput setaf 7)    # White
txtrst=$(tput sgr0)       # Text reset

# función de pausa
function pause(){
   read -p "$*"
}

clear

echo "   ______________________________________________________________"
echo "   |                                                            |"
echo "   |     ${txtpur}${txtbld}Natron Installer Shell Script for Ubuntu 22.04 LTS${txtrst}     |"
echo "   |     ${txtgrn}${txtbld}·················································· ${txtrst}    |"
echo "   |                                                            |"
echo "   |     By ${txtpur}${txtbld}SuperK2${txtrst} - superk2_cu@protonmail.com                 |"
echo "   |____________________________________________________________|"
echo "   |                                                            |"
echo "   |   ${txtred}No nos hacemos responsables de posibles daños en tu${txtrst}      |"
echo "   |   ${txtred}sistema. Este script experimental está desarrollado${txtrst}      |"
echo "   |   ${txtred}exclusivamente con fines de investigación, educativos${txtrst}    |"
echo "   |   ${txtred}y/o de formación.${txtrst}                                        |"
echo "   |                                                            |"
echo "   |   11 de Octubre de 2022                                    |"
echo "   |____________________________________________________________|"
echo "  "

pause "   >>>  Por favor, pulsa ${txtgrn}[ENTER] para CONTINUAR${txtrst} o ${txtred}[CTRL+C] para CANCELAR${txtrst} ..."

clear

echo "   ______________________________________________________________"
echo "   |                                                            |"
echo "   |     ${txtpur}${txtbld}Natron Installer Shell Script for Ubuntu 22.04 LTS${txtrst}     |"
echo "   |     ${txtgrn}${txtbld}Instalación de Dependencias${txtrst}                            |"
echo "   |____________________________________________________________|"
echo "   |                                                            |"
echo "   |     ${txtgrn}${txtbld}Instalando dependencias... por favor, espera${txtrst}           |"
echo "   |____________________________________________________________|"
echo "  "
echo "  "
sleep 1
sudo apt -qq install gh -y
sudo apt -qq install cmake -y
sudo apt -qq install git -y
sudo apt -qq install build-essential -y
sudo apt -qq install libboost-serialization-dev -y
sudo apt -qq install libboost-system-dev -y
sudo apt -qq install libexpat1-dev -y
sudo apt -qq install libcairo2-dev -y
sudo apt -qq install qt5-qmake -y
sudo apt -qq install qtbase5-dev -y
sudo apt -qq install python3-dev -y
sudo apt -qq install libshiboken2-dev -y
sudo apt -qq install libpyside2-dev -y
sudo apt -qq install python3-pyside2.qtwidgets -y
pause "   >>>  Por favor, pulsa ${txtgrn}[ENTER] para CONTINUAR${txtrst} o ${txtred}[CTRL+C] para CANCELAR${txtrst} ..."

clear

echo "   ______________________________________________________________"
echo "   |                                                            |"
echo "   |     ${txtpur}${txtbld}Natron Installer Shell Script for Ubuntu 22.04 LTS${txtrst}     |"
echo "   |     ${txtgrn}${txtbld}Instalación de NATRON${txtrst}                                  |"
echo "   |____________________________________________________________|"
echo "   |                                                            |"
echo "   |     ${txtgrn}${txtbld}Instalando NATRON... por favor, espera${txtrst}                 |"
echo "   |____________________________________________________________|"
echo "  "
echo "  "
sleep 1

sudo git clone https://github.com/NatronGitHub/Natron && cd Natron
sudo git submodule update -i --recursive
wget https://github.com/NatronGitHub/OpenColorIO-Configs/archive/Natron-v2.5.tar.gz
sudo tar xzf Natron-v2.5.tar.gz
sudo mv OpenColorIO-Configs-Natron-v2.5 OpenColorIO-Configs

pause "   >>>  Por favor, pulsa ${txtgrn}[ENTER] para CONTINUAR${txtrst} o ${txtred}[CTRL+C] para CANCELAR${txtrst} ..."
clear

echo "   ______________________________________________________________"
echo "   |                                                            |"
echo "   |     ${txtpur}${txtbld}Natron Installer Shell Script for Ubuntu 22.04 LTS${txtrst}     |"
echo "   |     ${txtgrn}${txtbld}Compilación / Build de NATRON${txtrst}                          |"
echo "   |____________________________________________________________|"
echo "   |                                                            |"
echo "   |     ${txtgrn}${txtbld}Instalando NATRON... por favor, espera${txtrst}                 |"
echo "   |____________________________________________________________|"
echo "  "
echo "  "
sleep 1

sudo echo "boost-serialization-lib: LIBS += -lboost_serialization" > config.pri
sudo mkdir build && cd build
sudo qmake -r ../Project.pro CONFIG+=python3
sudo make -j8


