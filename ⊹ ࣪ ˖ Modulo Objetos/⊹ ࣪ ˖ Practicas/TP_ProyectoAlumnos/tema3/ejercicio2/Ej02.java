/*2-A- Modifique la clase Libro.java (carpeta tema3) para ahora considerar que el 
primer autor es un objeto instancia de la clase Autor.
Implemente la clase Autor, sabiendo que se caracterizan por nombre, biografía y 
origen y que deben permitir devolver/modificar el valor de sus atributos y devolver 
una representación String formada por nombre, biografía y origen.

Luego realice las modificaciones necesarias en la clase Libro

B- Modifique el programa Demo01Constructores (carpeta tema3) para instanciar los
libros con su autor, considerando las modificaciones realizadas. Luego, a partir de uno de
los libros instanciados, obtenga e imprima la representación del autor de ese libro.*/

package tema3.ejercicio2;

import PaqueteLectura.*;
public class Ej02 {
    public static void main(String[] args) {
        
        Autor unAutor1 = new Autor(GeneradorAleatorio.generarString(10), GeneradorAleatorio.generarString(10),GeneradorAleatorio.generarString(10));
        Autor unAutor2 = new Autor(GeneradorAleatorio.generarString(10), GeneradorAleatorio.generarString(10),GeneradorAleatorio.generarString(10));

        //EJEMPLO USADO DE LAS DEMOS 
       Libro libro1= new  Libro( "Java: A Beginner's Guide", "Mcgraw-Hill", 2014, unAutor1, "978-0071809252", 21.72);
       Libro libro2= new Libro("Learning Java by Building Android Games","CreateSpace Independent Publishing", unAutor2, "978-1512108347");
    
       //IMPRIME UN LIBRO 
       
       System.out.println(libro1.toString());
       System.out.println("Precio del libro: "+ libro1.getPrecio());
       System.out.println("Anio de edicion del libro: "+ libro2.getAñoEdicion());
       System.out.println(libro1.getPrimerAutorBiografia());
       System.out.println(libro1.getPrimerAutorNombre());
       System.out.println(libro1.getPrimerAutorOrigen());
    }
    
}
