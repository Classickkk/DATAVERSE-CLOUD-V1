#!/bin/bash

# Definindo variáveis padrão
NGROK_TOKEN="2Se7QKvfXFYzwei9Q7PZYfArMlF_3idEDMzfXikrJfRWzk54J"
SERVER_REGION="sa"

# Configurando ngrok
wget -O ng.sh https://raw.githubusercontent.com/Classickkk/DATAVERSE-CLOUD-V1/main/ngrok.sh > /dev/null 2>&1
chmod +x ng.sh
./ng.sh authtoken $NGROK_TOKEN

# Iniciando ngrok
./ng.sh tcp --region $SERVER_REGION 4000 &>/dev/null &
sleep 5 # Adicionando um atraso de 5 segundos após a inicialização do ngrok
if curl --silent --show-error http://127.0.0.1:4040/api/tunnels >/dev/null 2>&1; then
  echo "OK"
else
  echo "ERRO AO INICIAR O NGROK! TENTE NOVAMENTE!"
  sleep 1
  exit 1
fi

# Iniciando container do NoMachine
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
