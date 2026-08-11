#!/bin/bash

FECHA=$(date +%Y-%m-%d_%H-%M-%S)

mkdir -p /backup

tar -czf /backup/respaldo_$FECHA.tar.gz /etc /home

echo "Respaldo realizado correctamente: respaldo_$FECHA.tar.gz"
