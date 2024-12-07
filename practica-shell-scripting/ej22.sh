#!/bin/bash
#Dada la siguiente declaración al comienzo de un script:
# num=(10 3 5 7 9 3 5 4) (la cantidad de elementos del arreglo 
#puede variar). Implemente la función productoria dentro de este
#script, cuya tarea sea multiplicar todos los números del arreglo

#IMPORTANTE: En expr debo escapar al * con \*
#IMPORTANTE: $@ es una variable especial que representa todos los argumentos pasados a un script o a una función
productoria() {
	local arreglo=($@) #recibo el vector como cadena y lo convierto nuevamente en vector
	if [ ${#arreglo[@]} -eq 0 ]; then #verifico si el arreglo no esta vacio
		echo "El arreglo esta vacio"
		return 1
	fi
	local mul=1	
	for elem in ${arreglo[@]}; do 
		mul=$(expr $mul \* $elem)	
	done
	echo "La multiplicacion de los elementos del arreglo es: $mul"
}


if [ $# -ne 0 ]; then
	echo "Error: el script no debe recibir parametros"
	exit 1
fi

num=(10 3 5 7 9 3 5 4)

#IMPORTANTE: Para pasar un arreglo como parametro debo hacer arreglo[@]
productoria "${num[@]}"

