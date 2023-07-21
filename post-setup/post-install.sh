# POST INSTALLER BY ClassicX
echo "BAIXANDO ARQUIVOS"
wget https://raw.githubusercontent.com/Classickkk/DATAVERSE-CLOUD-V1/main/post-setup/obs.sh
wget https://raw.githubusercontent.com/Classickkk/DATAVERSE-CLOUD-V1/main/post-setup/filezilla.sh
wget https://raw.githubusercontent.com/Classickkk/DATAVERSE-CLOUD-V1/main/post-setup/VSCode.sh
chmod +x obs.sh
chmod +x filezilla.sh
chmod +x VSCode.sh
mkdir /home/user/Desktop/Instaladores/
mv filezilla.sh /home/user/Desktop/Instaladores/
mv obs.sh /home/user/Desktop/Instaladores/
mv VSCode.sh /home/user/Desktop/Instaladores/

clear
echo "TODOS OS PROGRAMAS BAIXADOS DESEJA INSTALAR TODOS OS PROGRAMAS AGORA? (Y/N)"
read resposta

if [[ $resposta == "Y" || $resposta == "y" ]]; then
    echo "INSTALANDO OS PROGRAMAS"
    ./obs.sh
    clear
    ./filezilla.sh
    ./VSCode.sh
    clear
    echo "TODOS OS PROGRAMAS INSTALADOS COM SUCESSO!"
    rm post-install.sh
else
    clear
    echo "INSTALAÇÃO ENCERRADA,TODOS OS INSTALADORES SE ENCONTRAM NA AREA DE TRABALHO E PODEM SER INSTALADOS MANUALMENTE DE ACORDO COM SUA NECESSIDADE"
    rm post-install.sh
fi
