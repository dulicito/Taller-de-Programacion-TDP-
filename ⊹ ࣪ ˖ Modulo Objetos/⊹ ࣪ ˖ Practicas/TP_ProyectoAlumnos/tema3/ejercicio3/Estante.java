
package tema3.ejercicio3;

import tema3.ejercicio2.Libro;
public class Estante {
    private int cantLibros;
    private int max = 20;
    private Libro[] libros;

    public Estante() {
        this.cantLibros = 0;
        libros = new Libro [max];
    }
    
    // si el vector es de n libros, le paso por parametro el numero maximo n, para que lo modifique
    public Estante (int n){
        this.cantLibros = 0;
        max = n;
        libros = new Libro[n];
    }

    public int getCantLibros() {
        return cantLibros;
    }
    
    public boolean estaLleno(){
        return max == cantLibros;
    }
    
    public boolean agregarLibro(Libro libro1){
        if (!estaLleno()){
            libros[cantLibros++] = libro1;
            return true;
        }
        return false;
    }
    
    public Libro devolverTitulo (String titulo1){
        int aux = 0;
        while ((aux < cantLibros )&& (!titulo1.equals(this.libros[aux].getTitulo()))){
            aux++;
        }
        if (aux < cantLibros){
            return libros[aux];
        }
        else return null;
    }
}
