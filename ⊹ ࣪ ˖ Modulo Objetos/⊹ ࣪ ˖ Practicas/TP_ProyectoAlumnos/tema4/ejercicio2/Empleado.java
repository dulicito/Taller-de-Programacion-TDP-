
package tema4.ejercicio2;

public abstract class Empleado {
    private String nombre;
    private double sueldoBasico;
    private int antiguedad;

    public Empleado(String nombre, double sueldoBasico, int antiguedad) {
        this.nombre = nombre;
        this.sueldoBasico = sueldoBasico;
        this.antiguedad = antiguedad;
    }

    public String getNombre() {
        return nombre;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    @Override
    public String toString() {
        String aux =  "Nombre= "+ this.getNombre() + ", Sueldo Basico= "+this.getSueldoBasico()+", Antiguedad = "+ this.getAntiguedad();
        return aux;
    }

    
    public abstract double calcularEfectividad();
    
    public abstract double calcularSueldo(); 
    
    public double sueldoBase(){
        double aux= this.getSueldoBasico() + ((this.getSueldoBasico()*0.10)* this.getAntiguedad());
        return aux; 
    }
    
    
}
