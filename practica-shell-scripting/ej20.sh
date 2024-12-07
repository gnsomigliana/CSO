#!/bin/bash
#Realice un script que simule el comportamiento de una estructura de
# PILA e implemente las siguientes funciones aplicables sobre una 
#estructura global definida en el script: 
#push: Recibe un parámetro y lo agrega en la pila
#length: Devuelve la longitud de la pila
#pop: Saca un elemento de la pila
#print: Imprime todos elementos de la pila

#podemos pensar a la pila como un arreglo

if [ $# -ne 0 ]; then
	echo "Error: este script no debe recibir parametros"
	exit 1
fi

function push {
	pila[${#pila[@]}]=$1
	echo "Elemento $1 pusheado correctamente"
}

function pop {
	if [ ${#pila[@]} -eq 0 ]; then
		echo "La pila esta vacia, no se puede hacer pop"
	else	
		elem="${pila[-1]}"
		unset pila[-1] #importante no incluir $ sino accederiamos al valor y no a la variable en si
		echo "Elemento $elem popeado"
	fi
}

function length {
	echo "La pila tiene ${#pila[@]} elementos"
}

function imprimir {
	echo "Elementos de la pila: ${pila[@]}"
}
pila=() #creamos la pila vacia
push 5
push 2
push 3
imprimir
pop 
pop
pop
length
