#!/bin/bash
#Crear un script que verifique cada 10 segundos si un usuario se
# ha loqueado en el sistema (el nombre del usuario será pasado por
# parámetro). Cuando el usuario finalmente se loguee, el programa
# deberá mostrar el mensaje ”Usuario XXX logueado en el sistema”
# y salir.
#OBS: con grep -q hago una busqueda silenciosa devuelve 0 si encontro
# 1 si no se encontro y 2 si hubo un error
#Aclaracion: este script se encarga de verificar si el usuario esta 
#logueado actualmente, no de loguearlo, eso lo debe hacer el mismo por
#terminal o interfaz grafica

#verifico numero de parametros recibidos
if [ $# -ne 1 ]; then
	echo "Error: numero de parametros incorrectos"
	echo "Uso: $0 <nombre_de_usuario>"
	exit 1
fi

#mientras el usuario no se loguee debo iterar
while true; do  
	if who | grep -q $1; then
		echo "El usuario $1 esta logueado en el sistema"
		exit 0
	else
		echo "El usuario  $1 NO esta logueado en el sistema"
		sleep 10
	fi
done
