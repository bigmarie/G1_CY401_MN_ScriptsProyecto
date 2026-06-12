# G1_CY401_MN_ScriptsProyecto
## Descripción
Este repositorio es para el almacenamiento del versionamiento de los scripts utilizados para el proyecto del curso CY401.

## Scripts
Como parte de los requerimientos, se diseñaron dos scripts ejecutables en bash orientados al mantenimiento de la disponibilidad y el resguardo de la información.

El primer script realiza de forma autónoma el respaldo periódico del directorio de registros de la aplicación y del sistema en un archivo comprimido bajo el formato `.tar.gz` enviando de forma automática los resultados correspondientes a la bitácora del sistema.

El segundo script monitoriza el consumo de recursos de los procesos activos en memoria RAM y procesador, alertando de forma inmediata en caso de sobrepasar umbrales críticos predefinidos de carga.

Para asegurar la ejecución automática e imperceptible de estas tareas, se procede a automatizarlas haciendo uso de `cron` para que se ejecuten en intervalos específicos:
```
sudo crontab -e
```

Al archivo de crontab se añade:
```
# Ejecutar el respaldo de registros todos los días a la media noche (00:00)
0 0 * * * /user/local/bin/backup_logs.sh

# Ejecutar la verificación de rendimiento de procesos cada 5 min
*/5 * * * * /usr/local/bin/monitor_processes.sh
```