#!/bin/bash
# Script de Monitoreo de Procesos - /usr/local/bin/monitor_processes.sh
THRESHOLD=90
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

# Comparación aritmética de flotantes en Bash utilizando awk
OVER_LIMIT=$(awk -v cpu="$CPU_USAGE" -v limit="$THRESHOLD" 'BEGIN {print(cpu>limit)?1:0}')

if [ "$OVER_LIMIT" -eq 1 ]; then
    logger -p local0.warn "Alerta de rendimiento de CPU: El uso actual del procesador ($CPU_USAGE%) supera el umbral seguro de $THRESHOLD%."
fi