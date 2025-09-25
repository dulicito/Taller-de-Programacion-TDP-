/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

/**
 *
 * @author sofia
 */

/* 5- El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen
(con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad
de la comida (2) Precio (3) Ambiente.
Escriba un programa que lea desde teclado las calificaciones de los cinco clientes
para cada uno de los aspectos y almacene la información en una estructura. Luego
imprima la calificación promedio obtenida por cada aspecto.*/

/*
filas: clientes
columnas: aspectos 

*/

import PaqueteLectura.GeneradorAleatorio;

public class Ej05Restaurante {


    public static void main(String[] args) {

        //DECLARO MATRIZ y INICIALIZO ALEATORIOS 
        
        int DFclientes = 5;
        int DFaspectos = 4;
        
        int[][]calificaciones = new int[DFclientes][DFaspectos];
        
        GeneradorAleatorio.iniciar();
        
        //CARGO CALIFICACIONES CON NUMEROS ALEATORIOS 
        
        int cliente, aspecto; 
        
        for (cliente=0; cliente < DFclientes; cliente++ )
            for (aspecto= 0; aspecto <DFaspectos; aspecto++){
                calificaciones[cliente][aspecto] = 1 + GeneradorAleatorio.generarInt(11);
            }
        
        
        //CALCULAR Y MOSTRAR PROMEDIO POR ASPECTO 
        
        System.out.println("Promedio de cada aspecto: ");
        for (aspecto = 0; aspecto < DFaspectos; aspecto++){
            int suma = 0;
            
            for (cliente = 0; cliente < DFclientes; cliente++){
                suma+= calificaciones[cliente][aspecto];
            }
            
            double prom = suma / DFclientes;
            System.out.println("Promedio del aspecto nro: " + (aspecto + 1)+" : "+ prom);
            System.out.println("------------");
        }
    }
    
}
