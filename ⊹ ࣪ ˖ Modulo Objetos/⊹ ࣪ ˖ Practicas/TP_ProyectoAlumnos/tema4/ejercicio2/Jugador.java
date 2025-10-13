
package tema4.ejercicio2;

public class Jugador extends Empleado{
    private int partidosJugados;
    private int golesAnotados;

    public Jugador(int partidosJugados, int golesAnotados, String nombre, double sueldoBasico, int antiguedad) {
        super(nombre, sueldoBasico, antiguedad);
        this.partidosJugados = partidosJugados;
        this.golesAnotados = golesAnotados;
    }

    public int getPartidosJugados() {
        return partidosJugados;
    }

    public int getGolesAnotados() {
        return golesAnotados;
    }

    public void setPartidosJugados(int partidosJugados) {
        this.partidosJugados = partidosJugados;
    }

    public void setGolesAnotados(int golesAnotados) {
        this.golesAnotados = golesAnotados;
    }

    @Override
    public double calcularEfectividad() {
        double aux = this.getGolesAnotados() / this.getPartidosJugados();
        return aux; 
    }

    @Override
    public double calcularSueldo() {
        double aux = this.sueldoBase();
        
        if (this.calcularEfectividad()>0.5){
            aux = aux + this.getSueldoBasico();
        }
        
        return aux;
    }
    
    
}
