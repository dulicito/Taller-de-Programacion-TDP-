/*1- Se dispone de la clase Persona (en la carpeta tema2). Un objeto persona puede crearse
sin valores iniciales o enviando en el mensaje de creación el nombre, DNI y edad (en ese
orden). Un objeto persona responde a los siguientes mensajes:

*getNombre() retorna el nombre (String) de la persona
*getDNI() retorna el dni (int) de la persona
*getEdad() retorna la edad (int) de la persona
*setNombre(X) modifica el nombre de la persona al “String” pasado por parámetro (X)
*setDNI(X) modifica el DNI de la persona al “int” pasado por parámetro (X)
*setEdad(X) modifica la edad de la persona al “int” pasado por parámetro (X)
*toString() retorna un String que representa al objeto. Ej: “Mi nombre es Mauro, mi
DNI es 11203737 y tengo 70 años”

Realice un programa que cree un objeto persona con datos leídos desde teclado. Luego
muestre en consola la representación de ese objeto en formato String. */


package tema2;

import PaqueteLectura.Lector;

/**
 *
 * @author sofia
 */
public class Ej01 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Persona persona= new Persona();
        System.out.println("Ingrese un nombre: ");
        persona.setNombre(Lector.leerString());
        System.out.println("Ingrese un dni: ");
        persona.setDNI(Lector.leerInt());
        System.out.println("Ingrese una edad: ");
        persona.setEdad(Lector.leerInt());
        
        System.out.println(persona.toString());
    }
    
}
