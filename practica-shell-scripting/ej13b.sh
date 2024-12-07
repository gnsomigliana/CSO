#!/bin/bash
#Crear un script que muestre 3 opciones al usuario:
#Listar, DondeEstoy y QuienEsta.
#Según la opción elegida se le debe mostrar:
#Listar: lista el contenido del directoria actual.
#DondeEstoy: muestra el directorio donde me encuentro ubicado.
#QuienEsta: muestra los usuarios conectados al sistema.

echo "Ingrese la accion que quiere realizar (1:Listar, 2:DondeEstoy, 3:QuienEsta)"
read opc
case $opc in
"1")	
	echo "Listado del directorio actual: " `ls`
	;;
"2")	
	echo "Ubicacion del directorio actual: " `pwd`
	;;
"3")
	echo "Usuarios conectados al sistema: " `who`
	;;
"*")
	echo "Error: operacion invalida"
esac



