# POST INSTALLER BY ClassicX
echo "BAIXANDO ARQUIVOS"
wget https://raw.githubusercontent.com/Classickkk/DATAVERSE-CLOUD-V1/main/post-setup/obs.sh
wget https://raw.githubusercontent.com/Classickkk/DATAVERSE-CLOUD-V1/main/post-setup/filezilla.sh
wget https://raw.githubusercontent.com/Classickkk/DATAVERSE-CLOUD-V1/main/post-setup/VSCode.sh

echo "APLICANDO PERMISSÕES DE EXECUÇÃO NOS ARQUIVOS BAIXADOS"
chmod +x obs.sh
chmod +x filezilla.sh
chmod +x VSCode.sh

echo "DESEJA INSTALAR OS PROGRAMAS? (Y/N)"
read resposta

if [[ $resposta == "Y" || $resposta == "y" ]]; then
    echo "INSTALANDO OS PROGRAMAS"
    ./obs.sh
    clear
    ./filezilla.sh
    ./VSCode.sh
    clear
    echo "TODOS OS PROGRAMAS INSTALADOS COM SUCESSO!"
else
    echo "INSTALAÇÃO CANCELADA"
fi
