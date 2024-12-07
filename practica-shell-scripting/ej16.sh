#!/bin/bash
#Realizar un script que reciba como parámetro una extensión y haga
# un reporte con 2 columnas, el nombre de usuario y la cantidad de
# archivos que posee con esa extensión. Se debe guardar el
# resultado en un archivo llamado reporte.txt

#verifico numero de parametros recibidos
if [ "$#" -ne 1 ]; then
	echo "Error: numero de parametros incorrectos"
	echo "Uso $0 <Extension> "
	exit 1
fi

#creo archivo de salida vacio con redireccion destructiva , -n sirve para que no imprima el salto de linea
echo -n > reporte.txt

#etc/passwd : en campo 1 tengo usuarios del sistema y en el 6 sus home
for linea in $(cat /etc/passwd | cut -d: -f 1,6); do
	usuario=$(echo "$linea" | cut -d: -f 1) #tomo usuarios
	home=$(echo "$linea" | cut -d: -f 2 ) #tomo home de usuarios
	if [ -d $home ]; then
		cant=$(find $home -type f -name "*.$1" 2>/dev/null | wc -l) 
		if [ "$cant" -ne 0 ]; then
			echo "$usuario $cant" >> reporte.txt
		fi
	fi
done
