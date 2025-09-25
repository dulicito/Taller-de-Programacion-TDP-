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

/*4- Un edificio de oficinas está conformado por 8 pisos (1..8) y 
4 oficinas por piso (1..4). Realice un programa que permita informar 
la cantidad de personas que concurrieron a cada oficina de cada piso. 
Para esto, simule la llegada de personas al edificio de la siguiente 
manera: a cada persona se le pide el nro. de piso y nro. de oficina a 
la cual quiere concurrir. La llegada de personas finaliza al indicar un 
nro.de piso 9. Al finalizar la llegada de personas, informe lo pedido. */

/*para hacerlo mas tranqui usare el generar numeros randoms */

import PaqueteLectura.GeneradorAleatorio;
public class Ej04Oficinas {
    public static void main(String[] args) {
    
        // Inicializamos la estructura a usar 
        int[][]personas =new int[8][4];
        int piso,oficina;
        
        GeneradorAleatorio.iniciar();
        
        //simulamos llegadas de personas 
        /*DEBO INICIAR CADA POSICION EN 0? */
        
        piso = GeneradorAleatorio.generarInt(10);
        
        while (piso != 9){
            piso = 1 + GeneradorAleatorio.generarInt(9);
            
            if (piso >=1 && piso <= 8){
                oficina = 1 + GeneradorAleatorio.generarInt(4);
                personas[piso - 1][oficina - 1]++;
            }
        }
        
        //imprimimos 
        
        System.out.println("Cantidad de personas por Oficina y Piso: ");
        System.out.println("---------------------------------------");
        for (piso=0; piso<8; piso++){
            System.out.println("Piso: "+ (piso+1)+ ":");
            for (oficina=0; oficina <4; oficina++){
                System.out.println("Oficina: "+ (oficina+1) + ":" + personas[piso][oficina] + "personas");
            }
            System.out.println("---------------------------------------");

        }
        
        
    }
}
