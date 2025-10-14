
package parciales.TK;

public class Programador {
    private String nombre;
    private int dni;
    private double sueldoBasico;
    private int cantLineasCodPorHora;
    private String lenguajePreferencia;

    
    //GETTERS Y SETTERS NECESARIOS
    
    public String getNombre() {
        return nombre;
    }

    public int getDni() {
        return dni;
    }

    public String getLenguajePreferencia() {
        return lenguajePreferencia;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public int getCantLineasCodPorHora() {
        return cantLineasCodPorHora;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }
    
   
   //CONSTRUCTOR 
   public Programador(String nombre, int dni, double sueldoBasico, int cantLineasCodPorHora, String lenguajePreferencia) {
        this.nombre = nombre;
        this.dni = dni;
        this.sueldoBasico = sueldoBasico;
        this.cantLineasCodPorHora = cantLineasCodPorHora;
        this.lenguajePreferencia = lenguajePreferencia;
    }
    
    //CALCULAR SUELDO FINAL 
    public double calcularSueldoFinal(){
        double sueldoFinal = getSueldoBasico();
        if (getCantLineasCodPorHora() > 200){
            sueldoFinal += 50000;
        }
        return sueldoFinal;
    }
    //AUMENTAR SUELDO BASICO
    public void aumentarSueldoBasico (double monto){
        double aux= getSueldoBasico() + monto;
        setSueldoBasico(aux);
    }
    
    //TOSTRING

    @Override
    public String toString() {
        String aux = "{"+this.getNombre()+ ","+this.getLenguajePreferencia()+","+ this.calcularSueldoFinal();
        return aux;
    }
   
}
