# BackupTXT - Copia de seguridad de archivos .txt con informe HTML

Este proyecto contiene dos scripts en batch (`.bat`) que permiten realizar una copia de seguridad de hasta 5 archivos `.txt` desde una carpeta origen a una carpeta destino, y generar un informe en formato HTML con la información de la copia.

## 🗂 Archivos

### 1. `backup_txt.bat`

Script principal que solicita los datos al usuario y realiza la copia de los archivos `.txt`.

#### Funcionalidad:
- Solicita al usuario:
  - Nombre de usuario
  - Carpeta de origen (donde están los `.txt`)
  - Carpeta de destino
- Copia hasta 5 archivos `.txt` renombrándolos como `copia_1.txt`, `copia_2.txt`, etc.
- Llama al segundo script para generar un informe HTML con los datos y lista de archivos copiados.

#### Fragmento destacado:
```bat
for %%F in ("%origen%\*.txt") do (
    set "archivo=%%~F"
    copy "%%F" "%destino%\copia_!contador!.txt"
    echo Copiado: !archivo! como copia_!contador!.txt
    set /a contador+=1
    if !contador! gtr 5 goto :fin
)
