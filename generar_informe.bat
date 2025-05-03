@echo off
setlocal
rem Recoge los parámetros (~ elimina posibles "" para que no falle)
set "nombre=%~1"
set "origen=%~2"
set "destino=%~3"
set "total=%~4"
rem Archivo de informe HTML
set "informe=%destino%\informe_copia.html"
rem Escribe el HTML
(
rem Como < y > son caracteres con significado especial, se le incluye ^ para que lo imprima literalmente
echo ^<!DOCTYPE html^>
echo ^<html lang="es"^>
echo ^<head^>
echo     ^<meta charset="UTF-8"^>
echo     ^<title^>Informe de Copia de Seguridad^</title^>
echo     ^<style^>
echo         body { font-family: Arial; background-color: #f9f9f9; padding: 20px; }
echo         h1 { color: #2e6da4; }
echo         p { font-size: 14px; }
echo         ul { background: #fff; padding: 10px; border: 1px solid #ccc; }
echo     ^</style^>
echo ^</head^>
echo ^<body^>
echo     ^<h1^>Informe de Copia de Seguridad^</h1^>
echo     ^<p^>Usuario: %nombre%^</p^>
echo     ^<p^>Ruta de origen: %origen%^</p^>
echo     ^<p^>Ruta de destino: %destino%^</p^>
echo     ^<p^>Archivos copiados: %total%^</p^>
echo     ^<ul^>
) > "%informe%"

rem Añade los nombres de los archivos copiados
for /L %%i in (1,1,%total%) do (
    echo     ^<li^>copia_%%i.txt^</li^> >> "%informe%"
)
rem Cierra HTML - se podría haber incluído arriba, pero queria aprovechar para presentaros
rem Podríamos haberlo incluído en el bloque anterior (con >),
rem pero lo separamos para mostrar >> en lugar de > que añade lineas al archivo sin
rem sobreescribirlo
(
echo     ^</ul^>
echo ^</body^>
echo ^</html^>
) >> "%informe%"

echo Informe generado en: %informe%
start "" "%informe%"
endlocal