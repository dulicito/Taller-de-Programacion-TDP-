
package tema4.ejercicio2;

public class Entrenador extends Empleado{
    private int cantCampeonatosGanados; 

    public Entrenador(int cantCampeonatosGanado, String nombre, double unSueldo, int ant) {
       super(nombre,unSueldo,ant);
       this.getCantCampeonatosGanados();
        
    }

    public int getCantCampeonatosGanados() {
        return cantCampeonatosGanados;
    }

    public void setCantCampeonatosGanados(int cantCampeonatosGanados) {
        this.cantCampeonatosGanados = cantCampeonatosGanados;
    }

    @Override
    public double calcularEfectividad() {
        double aux = this.getCantCampeonatosGanados()/ this.getAntiguedad();
        return aux;
    }

    @Override
    public double calcularSueldo() {
        double aux = this.sueldoBase();
        if (this.getCantCampeonatosGanados() == 0){
            return aux;
        }
        else {
            if ((this.getCantCampeonatosGanados()>=1)&&(this.getCantCampeonatosGanados()<=4)){
                aux = aux + 5000;}
             else
        if ((this.getCantCampeonatosGanados()>=5) && (this.getCantCampeonatosGanados()<= 10)){
                aux = aux + 30000;
                }
        else aux = aux + 50000;
        }
        
     return aux;
    }
    
    
    
}
