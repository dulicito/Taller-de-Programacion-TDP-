/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*1- Analice el programa Ej01Tabla2.java, que carga un vector que representa la 
tabla del 2.
Genere enteros aleatorios hasta obtener el número 11. Para cada número muestre
el resultado de multiplicarlo por 2 (accediendo al vector).*/
package tema1;

import PaqueteLectura.GeneradorAleatorio;

public class Ej01Tabla2 {

    /**
     * Carga un vector que representa la tabla del 2
     */
    
    public static void main(String[] args) {
        int DF=11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        int i;
        
        //inicializo aleatorio por unica vez
        GeneradorAleatorio.iniciar();
        
        // carga vector con la tabla del 2 
        for (i=0;i<DF;i++) 
            tabla2[i]=2*i;
        System.out.println("2x" + "5" + "="+ tabla2[5]);
        
        //inicializo con un valor distinto a 11
        int num = -1;
        
        //repetir hasta que salga 11
        while (num != 11){
            num= GeneradorAleatorio.generarInt(12); //toma valores de 0 a 11
            System.out.println("El numero generado es: "+ num+ "; 2 x "+num+" = "+tabla2[num]);
        }
                
        
    }
    
}
