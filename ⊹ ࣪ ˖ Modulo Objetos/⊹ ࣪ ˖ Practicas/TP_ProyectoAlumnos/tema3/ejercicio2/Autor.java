
package tema3.ejercicio2;

public class Autor {
    private String nombre;
    private String biografia;
    private String origen;

    public Autor(String nombre, String biografia, String origen) {
        this.nombre = nombre;
        this.biografia = biografia;
        this.origen = origen;
    }
    
   public Autor(){
       
   }
// GETTERS
    public String getNombre() {
        return nombre;
    }

    public String getBiografia() {
        return biografia;
    }

    public String getOrigen() {
        return origen;
    }
   
//SETTERS

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    @Override
    public String toString() {
        return "Autor{" + "nombre=" + nombre + ", biografia=" + biografia + ", origen=" + origen + '}';
    }
    
    
}
