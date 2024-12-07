#!/bin/bash
# Comentarios acerca de lo que hace el script 
# Siempre comento mis scripts, si no hoy lo hago
# y mañana ya no me acuerdo de lo que quise hacer
# Este script lee un nombre y apellido y retorna estos 
# entre otras cosas
echo "Introduzca su nombre y apellido"
read nombre apellido
echo "Introduzca su edad"
read edad
echo "Introduzca su direccion"
read direccion
echo "Fecha y hora actual:"
date
echo "Su apellido y nombre es:"
echo $apellido $nombre
echo "Tiene $edad años"
echo "Su direccion es: $direccion "
echo "Su usuario es: `whoami`"
echo "Su directorio actual es: `pwd`"
echo "Su espacio libre en disco es: `df -h `"
echo "Datos sobre su RAM: `free -h `"

