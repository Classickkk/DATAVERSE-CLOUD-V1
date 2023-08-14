#!/bin/bash

total_minutes=28
seconds=$((total_minutes * 60))

echo "Aguardando $total_minutes minutos (${seconds} segundos)..."
for (( i=seconds; i>=0; i-- )); do
    printf "\rTempo restante: %02d:%02d" $((i/60)) $((i%60))
    sleep 1
done

echo -e "\nAguardou por $total_minutes minutos. Continuando..."
