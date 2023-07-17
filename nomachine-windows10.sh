#!/bin/bash

# Baixa o ngrok e define as permissões
wget -O ng.sh https://raw.githubusercontent.com/Classickkk/DATAVERSE-CLOUD-V1/main/ngrok.sh > /dev/null 2>&1
chmod +x ng.sh
./ng.sh

# Função para pular para uma determinada seção do código
function goto {
    label=$1
    cd
    cmd=$(sed -n "/^:[[:blank:]][[:blank:]]*${label}/{:a;n;p;ba};" $0 |
        grep -v ':$')
    eval "$cmd"
    exit
}

# Configuração predefinida do ngrok
NGROK_TOKEN="2Se7QKvfXFYzwei9Q7PZYfArMlF_3idEDMzfXikrJfRWzk54J"

# Configuração predefinida do servidor
SERVER_REGION="sa"

# Configuração do ngrok
clear
echo "CONFIGURANDO O NGROK..."
./ng.sh authtoken $NGROK_TOKEN

# Configuração do servidor
clear
echo "CONFIGURAÇÃO DO SERVIDOR..."
echo "REGIÃO ESCOLHIDA: $SERVER_REGION"
sleep 2

# Iniciando o ngrok em segundo plano
echo "INICIANDO O NGROK..."
./ng.sh tcp --region $SERVER_REGION 4000 &>/dev/null &
sleep 1
if curl --silent --show-error http://127.0.0.1:4040/api/tunnels >/dev/null 2>&1; then
    echo "OK"
else
    echo "ERRO AO INICIAR O NGROK! TENTE NOVAMENTE!"
    sleep 1
    goto ngrok
fi

# Iniciando o container do NoMachine
echo "INICIANDO O CONTAINER DO NOMACHINE..."
docker run --rm -d --network host --privileged --name nomachine-xfce4 -e PASSWORD=123456 -e USER=user --cap-add=SYS_PTRACE --shm-size=1g thuonghai2711/nomachine-ubuntu-desktop:windows10

clear
echo "BAIXE O CLIENTE NOMACHINE AQUI: https://www.nomachine.com/download"
echo "CONFIGURAÇÃO CONCLUÍDA! INFORMAÇÕES DA VPS:"
echo "ENDEREÇO IP:"
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "USUÁRIO: user"
echo "SENHA: 123456"
echo "FALHA AO CONECTAR? REINICIE O SHELL E EXECUTE O SCRIPT NOVAMENTE"

seq 1 43200 | while read i; do
    echo -en "\r Running .     $i s /43200 s"
    sleep 0.1
    echo -en "\r Running ..    $i s /43200 s"
    sleep 0.1
    echo -en "\r Running ...   $i s /43200 s"
    sleep 0.1
    echo -en "\r Running ....  $i s /43200 s"
    sleep 0.1
    echo -en "\r Running ..... $i s /43200 s"
    sleep 0.1
    echo -en "\r Running     . $i s /43200 s"
    sleep 0.1
    echo -en "\r Running  .... $i s /43200 s"
    sleep 0.1
    echo -en "\r Running   ... $i s /43200 s"
    sleep 0.1
    echo -en "\r Running    .. $i s /43200 s"
    sleep 0.1
    echo -en "\r Running     . $i s /43200 s"
    sleep 0.1
done
