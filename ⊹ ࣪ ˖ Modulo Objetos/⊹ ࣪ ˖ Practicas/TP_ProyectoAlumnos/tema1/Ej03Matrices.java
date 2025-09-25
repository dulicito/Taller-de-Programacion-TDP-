/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*3 - Escriba un programa que defina una matriz de enteros de tamaño 5x5. Inicialice
la matriz con números aleatorios entre 0 y 30.
Luego realice las siguientes operaciones:

- Mostrar el contenido de la matriz en consola.

- Calcular e informar la suma de los elementos de la fila 1

- Generar un vector de 5 posiciones donde cada posición j contiene la suma
de los elementos de la columna j de la matriz. Luego, imprima el vector.

- Leer un valor entero e indicar si se encuentra o no en la matriz. En caso de
encontrarse indique su ubicación (fila y columna) en caso contrario
imprima “No se encontró el elemento”.   */

package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
	//Paso 2. iniciar el generador aleatorio     
	 GeneradorAleatorio.iniciar();
            
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int [][] matriz;
        matriz = new int [5][5];
        
        int f,c;
        for ( f=0; f<5; f++)
            for (c=0; c<5; c++)
                matriz[f][c] = 1 + GeneradorAleatorio.generarInt(31); 
        
        //Paso 4. mostrar el contenido de la matriz en consola
        for ( f=0; f<5; f++)
           for (c=0; c<5; c++)
               /*preguntar cual forma de imprimir es la mas correcta*/
               /* System.out.print(matriz[f][c] + "\t");*/
               System.out.println(" Fila: "+ (f+1) + ", Columna: "+ (c+1) +" tiene el valor: "+matriz[f][c]);
        
        
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
    
        int sumaFila1 = 0;
        for (c=0; c <5; c++){
            sumaFila1 += matriz[0][c];
        }
        System.out.println("La suma de los elementos de la fila 1 es: "+ sumaFila1 );
        
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la 
        //suma de los elementos de la columna j de la matriz. 
        // Luego, imprima el vector.

        int[] sumaColumnas = new int[5];
        for ( c = 0; c < 5; c++) {
            int suma = 0;
            for ( f = 0; f < 5; f++) {
                suma += matriz[f][c];
            }
            sumaColumnas[c] = suma;
        }
        
        System.out.println("Suma de cada columna: ");
        for (c=0; c< 5; c++){
            System.out.println("Columna" + (c+1)+":"+sumaColumnas[c]); 
        }
        
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso 
        //de encontrarse indique su ubicación (fila y columna)
        //y en caso contrario imprima "No se encontró el elemento".
        
        System.out.println("Ingrese un numero a buscar: ");
        int num= Lector.leerInt();
        boolean encontrado = false;
        
        for (f=0; f<5 && !encontrado; f++){
            for (c=0; c<5 && !encontrado; c++){
                if (matriz[f][c] == num){
                    encontrado = true; 
                }
            }
        }
        if (encontrado)
           System.out.println("Se encontro! ");
           else System.out.println("No se encontro :C ");
       
        
    }
}
