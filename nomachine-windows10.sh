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
echo "CRIE SEU TOKEN AQUI: https://dashboard.ngrok.com/get-started/your-authtoken"
read -p "COLE O AUTHTOKEN DO NGROK AQUI: " CRP
./ngrok authtoken $CRP 

clear
echo "REPOSITÓRIO: https://github.com/Classickkk/DATAVERSE-CLOUD-V1/tree/main"
echo "======================="
echo "ESOLHA A REGIÃO (PARA MELHOR VELOCIDADE)."
echo "======================="
echo "us - ESTADOS UNIDOS (Ohio)"
echo "eu - EUROPA (Frankfurt)"
echo "ap - ASIA/PACÍFICO (Singapore)"
echo "au - AUSTRÁLIA (Sydney)"
echo "sa - AMERICADO DO SUL (São Paulo)"
echo "jp - JAPÃO (Tokyo)"
echo "in - INDIA (Mumbai)"
read -p "REGIÃO ESCOLHIDA: " CRP
./ngrok tcp --region $CRP 4000 &>/dev/null &
sleep 1
if curl --silent --show-error http://127.0.0.1:4040/api/tunnels  > /dev/null 2>&1; then echo OK; else echo "ERRO DO NGROK! TENTE NOVAMENTE!" && sleep 1 && goto ngrok; fi
docker run --rm -d --network host --privileged --name nomachine-xfce4 -e PASSWORD=123456 -e USER=user --cap-add=SYS_PTRACE --shm-size=1g thuonghai2711/nomachine-ubuntu-desktop:windows10
clear
echo "BAIXE AQUI O CLIENTE NOMACHINE: https://www.nomachine.com/download"
echo FEITO! INFO DA VPS:
echo ENDEREÇO IP:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p' 
echo USUÁRIO: user
echo SENHA: 123456
echo "FALHA AO CONECTAR? REINICIE O SHELL E EXECUTE O SCRIPT NOVAMENTE"
seq 1 43200 | while read i; do echo -en "\r Running .     $i s /43200 s";sleep 0.1;echo -en "\r Running ..    $i s /43200 s";sleep 0.1;echo -en "\r Running ...   $i s /43200 s";sleep 0.1;echo -en "\r Running ....  $i s /43200 s";sleep 0.1;echo -en "\r Running ..... $i s /43200 s";sleep 0.1;echo -en "\r Running     . $i s /43200 s";sleep 0.1;echo -en "\r Running  .... $i s /43200 s";sleep 0.1;echo -en "\r Running   ... $i s /43200 s";sleep 0.1;echo -en "\r Running    .. $i s /43200 s";sleep 0.1;echo -en "\r Running     . $i s /43200 s";sleep 0.1; done
