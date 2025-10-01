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


import PaqueteLectura.Lector;

public class Ej04Oficinas {
    public static void main(String[] args) {
    
        // Inicializamos la estructura a usar 
        int[][]personas =new int[8][4];
        int piso,oficina;
                
        // inicializo manualmente la matriz, because lo dice la catedra 
        for (int f = 0; f < 8; f++){
            for (int c = 0; c< 4; c++){
                personas[f][c]= 0;
            }
        }
        
        //simulacion de llegada de personas
        System.out.println(("Ingrese el numero de piso (1 a 8) al que desea ingresar"));
        piso = Lector.leerInt();
        
        while (piso != 9){
            System.out.println("Ingrese el numero de oficina(1 a 4):");
            oficina = Lector.leerInt();
            
            if (piso >=1 && piso <=8){
                if (oficina >= 1 && oficina <= 4){
                    personas[piso-1][oficina-1]++;
                }
            } else {System.out.println("Datos ingresados fuera del rango, Intentelo de nuevo.");}
       
            System.out.println("Ingrese el numero de piso (1 a 8) al que desea ingresar");
            piso = Lector.leerInt();
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
