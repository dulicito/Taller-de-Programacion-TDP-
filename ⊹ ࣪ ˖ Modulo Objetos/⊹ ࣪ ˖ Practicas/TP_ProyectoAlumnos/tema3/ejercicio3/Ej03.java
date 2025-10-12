
package tema3.ejercicio3;

import PaqueteLectura.*;
import tema3.ejercicio2.*;

public class Ej03 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Estante estante1 = new Estante();
        
        //cargo vector
        int i;
        
        for (i = 0; i < 12; i++) {
            
            //creo un autor
            Autor unAutor=new Autor(GeneradorAleatorio.generarString(3),GeneradorAleatorio.generarString(3),GeneradorAleatorio.generarString(3));
            //creo un libro, agregandole por parametro el autor 
            Libro libro = new Libro(GeneradorAleatorio.generarString(3), GeneradorAleatorio.generarString(3),GeneradorAleatorio.generarInt(3), unAutor ,GeneradorAleatorio.generarString(3),GeneradorAleatorio.generarDouble(3));
            //si el libro = 5, modifico cambiandole el titulo por "mujercitas"
            if (i == 5){
                libro.setTitulo("Mujercitas");
            }
            //agrego libro al vector 
            estante1.agregarLibro(libro);
        }
        System.out.println("Cantidad de libros: "+ estante1.getCantLibros());
        System.out.println("Esta lleno el vector? "+ estante1.estaLleno());
        System.out.println("Autor del libro mujercitas: "+estante1.devolverTitulo("Mujercitas").getPrimerAutor().getNombre());

    }
    
}
