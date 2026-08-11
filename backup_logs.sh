#!/bin/bash
# Script de Respaldo de Logs - /usr/local/bin/backup_logs.sh
DEST_DIR="/var/backups/system_logs"
SRC_DIR="/var/log"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$DEST_DIR/log_backup_$TIMESTAMP.tar.gz"

if [ ! -d "$DEST_DIR" ]; then
    mkdir -p "$DEST_DIR"
    chmod 700 "$DEST_DIR"
fi

tar -czf "$BACKUP_FILE" "$SRC_DIR"/*.log 2>/dev/null

if [ $? -eq 0 ]; then
    logger -p local0.info "Respaldo automatizado de registros del sistema completado con éxito: $BACKUP_FILE"
else
    logger -p local0.err "Error crítico durante la ejecución del respaldo automatizado de registros."
fi