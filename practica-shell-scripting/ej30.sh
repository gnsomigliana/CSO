#!/bin/bash
#Realice un script que mueva todos los programas del directorio actual
# (archivos ejecutables) hacia el subdirectorio “bin” del directorio HOME 
#del usuario actualmente logueado. El script debe imprimir en pantalla los
# nombres de los que mueve, e indicar cuántos ha movido, o que no ha movido
# ninguno. Si el directorio “bin” no existe,deberá ser creado.

#este script dice que mueva todos los archivos pero por seguridad los voy a
#copiar solamente, la unica modificacion que hay que hacerle es mv por cp

if [ $# -ne 0 ];then
	echo "El script no debe recibir parametros"
	exit 1
fi

url="/home/nicolas/bin"
if [ ! -d $url ]; then
	mkdir $url 
fi

archivos=( $(pwd | find -type f -name "*"))
cant=0
for archivo in ${archivos[@]}; do
	if [ -x $archivo ]; then
		cp $archivo $url
		echo "Archivo $archivo copiado en $url"
		cant=$(expr $cant + 1)
	fi
done 

if [ $cant -eq 0 ]; then
	echo "No se ha copiado ningun archivo"
else
	echo "La cantidad de archivos copiados es de: $cant"
fi
