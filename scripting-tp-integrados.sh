#1.	Pedir un numero entero y mostrar esa cantidad de elementos de la sucesion de Fibonacci.
#2.	Pedir un numero entero y mostrar por pantalla ese numero en forma invertida.
#3.	Pedir una cadena de caracteres y evaluar si es palindromo o no.
#4.	Pedir el path a un archivo de texto y mostrar por pantalla la cantidad de lineas que tiene.
#5.	Pedir el ingreso de 5 numeros enteros y mostrarlos por pantalla en forma ordenada.
#6.	Pedir el path a un directorio y mostrar por pantalla cuantos archivos de cada tipo contiene (No se tenga en cuenta ./ y ../).
#7.	Salir (Saludando al usuario que ejecuto el programa).


#!/bin/bash ---------- FUNCIONES ---------- #
function mostrar_menu(){
 clear
echo "1) Fibonacci"
echo "2) Numero invertido"
echo "3) Palindromo"
echo "4) Conteo lineas PATH"
echo "5) Orden cinco numeros"
echo "6) Mostrar contenido PATH"
echo "7) Salir"
echo "-------------------------------------------------------------"
}

function salir_saludando(){
 NOMBRE=$1 # Guardo el parametro nro. 1 que recibe la function
 echo "Saludos $NOMBRE !!"
}


# ---------------------------- PROGRAMA PRINCIPAL ---------------------------- #
OPCION=0
mostrar_menu
 while true; do
  read -p "Ingrese una opcion: " OPCION # Mensaje y read en la misma linea
  case $OPCION in


   1)clear
     read -p "INGRESE UN NUMERO: " NUMERO
     contador=0
     i=1
     j=0
     t=0
    while [ $contador -le $NUMERO ] ;do
     let t=$i+$j
     i=$j
     j=$t
     echo $j
     let contador=$contador+1
     sleep 1
     done

    ;;


   2) clear
       echo "INGRESE UN NUMERO"
            read NUMERO
          echo $NUMERO | rev
              ;;

   3) clear
   LEN=0
   I=1
   read -p "Ingrese una cadena de caracteres: " STR
   LEN=`echo $STR | wc -m`
   LEN=`expr $LEN - 1`
     if [ ! $LEN -eq 0 ]; then

     MITAD=`expr $LEN / 2`
     while [ $I -le $MITAD ]; do
      C1=`echo $STR|cut -c$I`
      C2=`echo $STR|cut -c$LEN`
      if [ $C1 != $C2 ]; then
       echo "La cadena no es un palindromo"
        exit
      fi
      I=`expr $I + 1`
      LEN=`expr $LEN - 1`
     done
     echo "La cadena es un palindromo"
   else
   echo "ERROR: La cadena ingresada es incorrecta"
  fi;;


    4)clear
     echo "Ingrese el PATH del txt: "
     read PATH
     echo `$PATH | wc -l`
       ;;


5) clear 
IFS=' ' read -ra arr -p "INGRESE CINCO NUMEROS SEPARADOS POR ESPACIOS: "
sort -n <(printf "%s\n" "${arr[@]}")



;;
6) clear
   read -p "Ingrese el PATH de un directorio: " PATH
   DIRECTORIO=0
   FICHERO=0

for PATH in *
  do
   if test -f "$PATH"; then
   FICHERO=`$FICHERO + 1`
   echo "Archivos $FICHERO"

   else test -d "$PATH" then
   DIRECTORIO=`$DIRECTORIO +1`
   echo "Directorios $DIRECTORIO"
  fi
done;;

7) clear
   salir_saludando `whoami`
   break;;

esac

done
exit 0
