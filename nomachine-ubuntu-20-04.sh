wget -O ng.sh https://raw.githubusercontent.com/Classickkk/DATAVERSE-CLOUD-V1/main/ngrok.sh > /dev/null 2>&1
chmod +x ng.sh
./ng.sh


function goto
{
    label=$1
    cd 
    cmd=$(sed -n "/^:[[:blank:]][[:blank:]]*${label}/{:a;n;p;ba};" $0 | 
          grep -v ':$')
    eval "$cmd"
    exit
}

: ngrok
clear
echo "AUTENTICANDO AO NGROK"
./ngrok authtoken 2Se7QKvfXFYzwei9Q7PZYfArMlF_3idEDMzfXikrJfRWzk54J
./ngrok tcp --region sa 4000 &>/dev/null &
sleep 1
if curl --silent --show-error http://127.0.0.1:4040/api/tunnels  > /dev/null 2>&1; then echo OK; else echo "ERRO DO NGROK! TENTE NOVAMENTE!" && sleep 1 && goto ngrok; fi
sudo docker run --rm -d --network host --privileged --name nomachine-xfce4 -e PASSWORD=123456 -e USER=user --cap-add=SYS_PTRACE --shm-size=1g kxes/desktop



echo "===================================================================="
echo "BAIXE AQUI O CLIENTE NOMACHINE: https://www.nomachine.com/download"
echo "===================================================================="
echo FEITO! INFO DA SUA VPS:
echo ENDEREÇO IP:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p' 
echo USUÁRIO: user
echo SENHA: 123456
echo "SHELL SCRIPT CODADO PELO ClassicX-O-BRABO"
echo "FALHA AO CONECTAR? REINICIE O SHELL E EXECUTE O SCRIPT NOVAMENTE"
echo "===================================================================="
seq 1 43200 | while read i; do echo -en "\r Running .     $i s /43200 s";sleep 0.1;echo -en "\r Running ..    $i s /43200 s";sleep 0.1;echo -en "\r Running ...   $i s /43200 s";sleep 0.1;echo -en "\r Running ....  $i s /43200 s";sleep 0.1;echo -en "\r Running ..... $i s /43200 s";sleep 0.1;echo -en "\r Running     . $i s /43200 s";sleep 0.1;echo -en "\r Running  .... $i s /43200 s";sleep 0.1;echo -en "\r Running   ... $i s /43200 s";sleep 0.1;echo -en "\r Running    .. $i s /43200 s";sleep 0.1;echo -en "\r Running     . $i s /43200 s";sleep 0.1; done
