@echo off
setlocal enabledelayedexpansion

:: Solicita los datos
set /p nombre=Nombre de usuario: 
set /p origen=Introduce la ruta de la carpeta de origen: 
set /p destino=Introduce la ruta de la carpeta de destino: 

set contador=1

:: Crea el directorio destino si no existe
if not exist "%destino%" mkdir "%destino%"

:: Recorremos los archivos .txt y copiamos
for %%F in ("%origen%\*.txt") do (
    set "archivo=%%~F"
    copy "%%F" "%destino%\copia_!contador!.txt"
    echo Copiado: !archivo! como copia_!contador!.txt
    set /a contador+=1
    if !contador! gtr 5 goto :fin
)

:fin
set /a total_copias=contador-1
:: Llama al segundo script para generar el HTML
call generar_informe.bat "%nombre%" "%origen%" "%destino%" !total_copias!

pause
endlocal



