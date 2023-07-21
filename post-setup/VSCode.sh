# Installer Filezilla BY ClassicX
echo | sudo apt update
echo | sudo wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -O code.deb
echo | chmod +x code.deb
echo | sudo dpkg -i ./code.deb
clear
echo "VSCode INSTALADO!"