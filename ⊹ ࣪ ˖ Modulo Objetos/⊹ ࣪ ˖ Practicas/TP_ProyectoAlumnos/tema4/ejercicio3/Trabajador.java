
package tema4.ejercicio3;

public class Trabajador extends Persona{
    private String trabajo;

    public Trabajador(String trabajo, String nombre, int DNI, int edad) {
        super(nombre, DNI, edad);
        this.trabajo = trabajo;
    }

    public String getTrabajo() {
        return trabajo;
    }

    public void setTrabajo(String trabajo) {
        this.trabajo = trabajo;
    }

    @Override
    public String toString() {
        String aux = super.toString() + ", y Soy "+this.getTrabajo();
        return aux;
    }
    
    
}
