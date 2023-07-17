#!/bin/bash
stty intr ""
stty quit ""
stty susp undef

clear
rm -rf ngrok ngrok.zip ng.sh > /dev/null 2>&1
echo "======================="
echo "Baixando NGROK..."
echo "======================="
wget -O ngrok.zip https://github.com/Classickkk/DATAVERSE-CLOUD-V1/raw/main/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok.zip > /dev/null 2>&1

