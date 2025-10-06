/*2- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
obtener edad 0. Luego de almacenar la información:

 - Informe la cantidad de personas mayores de 65 años.
 - Muestre la representación de la persona con menor DNI. */

package tema2;

/**
 *
 * @author sofia
 */

/*
PSEUDOCODIGO:
cargo el vector mientras edad no es 0 y diml < 15
    genero numeros aleatorio en cada campo
    asigno la clase a la posicion del vector actual 
    dimension logica +1
    leo otra edad

recorro vector ya cargado 
    si la edad de la persona = +65 
        contador+1 
    calculo minimos comparando con dni

imprimo los incisos que me pidieron*/


import PaqueteLectura.GeneradorAleatorio;

public class Ej02 {
    public static void main(String[] args) {
        //variables 
        int df = 15;
        int diml = 0;
        int i;
        Persona [] vector = new Persona[df];
        
        GeneradorAleatorio.iniciar();
        int edad = GeneradorAleatorio.generarInt(90);
        
        //cargo vector previamente
        for (i=0; i < diml; i++){
            vector[i]= null;
        }
        
        //cargo vector c/ datos
        while (edad != 0 && diml < 15){
            String nombre = GeneradorAleatorio.generarString(11);
            int dni = GeneradorAleatorio.generarInt(50);
            vector[diml]= new Persona(nombre, dni, edad);
            diml ++;
            edad=GeneradorAleatorio.generarInt(90);
        }
        
        //recorro vector y pregunto 
        
        int min = 999;
        int cont = 0;
        
        Persona permin = null;
        
        for (i = 0; i < diml ; i ++){
            if (vector[i].getEdad() > 65)
                cont++;
            if (vector[i].getDNI() < min){
                min = vector[i].getDNI();
                permin = vector[i];
            }
        }
        
        System.out.println("A. La cantidad de personas mayores de 65 anios es: "+cont);
        System.out.println("B.Datos de la persona con el dni mas chico: "+permin.toString());
    }
    
}
