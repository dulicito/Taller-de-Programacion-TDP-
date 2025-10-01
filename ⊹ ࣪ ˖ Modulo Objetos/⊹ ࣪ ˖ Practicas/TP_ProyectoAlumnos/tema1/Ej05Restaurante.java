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

import PaqueteLectura.Lector;

public class Ej05Restaurante {


    public static void main(String[] args) {

        //DECLARO MATRIZ 
        
        int DFclientes = 5;
        int DFaspectos = 4;
        
        int[][]calificaciones = new int[DFclientes][DFaspectos];
        
        
        //INICIALIZO MATRIZ MANUALMENTE 
        for (int f = 0; f < DFclientes; f++) {
            for (int c = 0; c < DFaspectos; c++) {
                calificaciones[f][c] = 0;
            }
        }
        
        
        //CARGO CALIFICACIONES
        //CON EL DO WHILE FUERZO AL USUARIO PARA QUE INGRESE UN NUMERO POR TECLADO DENTRO DEL RANGO PREESTABLECIDO >:V
        int cliente, aspecto; 
        
        for (cliente  = 0; cliente < DFclientes; cliente++){
            System.out.println("Ingrese una calificacion para el cliente nro "+ (cliente + 1));
            for (aspecto = 0; aspecto < DFaspectos; aspecto++){
                int note;
                do {
                    System.out.print("Calificación del aspecto nro " + (aspecto + 1) + " (1 a 10): ");
                    note = Lector.leerInt();
                    if (note < 1 || note > 10) {
                        System.out.println("Valor incorrecto, ingrese un número entre 1 y 10.");
                    }
                } while (note < 1 || note > 10);

                calificaciones[cliente][aspecto] = note;
            }
        }

        
        //CALCULAR Y MOSTRAR PROMEDIO POR ASPECTO 
        
        System.out.println("Promedio de cada aspecto: ");
        for (aspecto = 0; aspecto < DFaspectos; aspecto++){
            int suma = 0;
            
            for (cliente = 0; cliente < DFclientes; cliente++){
                suma+= calificaciones[cliente][aspecto];
            }
            
            double prom = (double)suma / DFclientes;
            System.out.println("Promedio del aspecto nro: " + (aspecto + 1)+" : "+ prom);
            System.out.println("------------");
        }
    }
    
}
