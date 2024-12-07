#!/bin/bash
# Se nos pide hacer una calculadora que reciba la operacion y los
# operandos por parametros (asumimos que dos)
# Debe hacer las 4 operaciones basicas: +, -, *, /

if [ "$#" -ne "3" ]; then
	echo "Error: numero de parametros incorrectos"
	exit 1
fi

#con doble [] nos permite escribir multiples condiciones como una sola
if [[ "$1" != "+" && "$1" != "-" && "$1" != "*" && "$1" != "/" ]]; then
	echo "Error: operacion inadecuada (+, - , *, /)"
	exit 1
fi

case $1 in #en bash no hace falta ejecutar el break
"*")
	res=$(( $2 * $3 ))
	;;
"+")
	res=$(( $2 + $3 ))
	;;
"-")
	res=$(( $2 - $3 ))
	;;
"/")
	res=$(( $2 / $3 ))
	;;
esac
echo "$2 $1 $3 = $res"

#tiene un error que no logro visualizar, cuando ingreso $1 me entra
#en el primer error
#solucion:en el pasaje de parametros * funciona como comodín para
# hacer coincidir cualquier número de
# caracteres en nombres de archivos.
