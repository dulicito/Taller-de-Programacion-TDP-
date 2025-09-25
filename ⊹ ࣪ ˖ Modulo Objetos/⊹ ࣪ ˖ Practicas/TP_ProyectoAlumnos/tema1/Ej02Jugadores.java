/*2- Escriba un programa que lea las alturas de los 15 jugadores de un equipo de
básquet y las almacene en un vector. Luego informe:
- la altura promedio
- la cantidad de jugadores con altura por encima del promedio
NOTA: Dispone de un esqueleto para este programa en Ej02Jugadores.java*/



package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos

import PaqueteLectura.GeneradorAleatorio;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        
        //Paso 2: Declarar la variable vector de double 
        double []vectorJugadores;
        
        //Paso 3: Crear el vector para 15 double 
        int DF=15;
        vectorJugadores = new double[DF];
        
        //Paso 4: Declarar indice y variables auxiliares a usar
        int i;
        double suma = 0;
        int cant = 0;
        GeneradorAleatorio.iniciar();
        
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i=0; i<DF; i++){
            vectorJugadores[i] = 1 + GeneradorAleatorio.generarDouble(20);
            suma += vectorJugadores[i];
        }
        
        //Paso 7: Calcular el promedio de alturas, informarlo
        
        /* me imprime muchos decimales, preguntar si hay posibilidad de imprimir
        el valor con dos decimales, como en pascal cuando aplicamos prom:0:2 */
        
        double prom = suma / DF; 
        System.out.println("El promedio de las alturas es: " + prom );

        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima) del promedio)
        for (i= 0; i< 15; i++){
            if (vectorJugadores[i] >  prom )
                cant++;
        }
        
        //Paso 9: Informar la cantidad.

        System.out.println("La cantidad de jugadores que estan por encima del promedio es: " + cant);
        
     }
    
}
