
package tema3.ejercicio4;

public class Cliente {
    private String nombre;
    private int dni;
    private int edad;
    
    public Cliente (String unNombre, int unDni, int unaEdad){
        nombre = unNombre;
        dni = unDni;
        edad= unaEdad;
    }

    public String getNombre() {
        return nombre;
    }

    public int getDni() {
        return dni;
    }

    public int getEdad() {
        return edad;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    @Override
    public String toString() {
        return "Cliente{" + "nombre=" + nombre + ", dni=" + dni + ", edad=" + edad + '}';
    }
    
    
    
}
