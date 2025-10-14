
package parciales.TK;

public class ProgramadorLider extends Programador{
    private int antiguedadAnios;
    private int cantProyectosDirigidos;

    public int getAntiguedadAnios() {
        return antiguedadAnios;
    }

    public int getCantProyectosDirigidos() {
        return cantProyectosDirigidos;
    }
    
    //CONSTRUCTOR
    public ProgramadorLider(int antiguedadAnios, int cantProyectosDirigidos, String nombre, int dni, double sueldoBasico, int cantLineasCodPorHora, String lenguajePreferencia) {
        super(nombre, dni, sueldoBasico, cantLineasCodPorHora, lenguajePreferencia);
        this.antiguedadAnios = antiguedadAnios;
        this.cantProyectosDirigidos = cantProyectosDirigidos;
    }
    
    // CALCULAR SUELDO FINAL 
    
    public double calcularSueldoFinal(){
       double sueldoFinal = super.calcularSueldoFinal();
       sueldoFinal +=  this.getAntiguedadAnios() * 10000;
       sueldoFinal += this.getCantProyectosDirigidos() * 20000;
       return sueldoFinal;
    }
    //TOSTRING 

    @Override
    public String toString() {
        String aux = "Programador Lider: {"+super.getNombre()+
                ","+super.getLenguajePreferencia()+","
                + this.calcularSueldoFinal()+"}";
        return aux;
         }

   

    

   
    
}
