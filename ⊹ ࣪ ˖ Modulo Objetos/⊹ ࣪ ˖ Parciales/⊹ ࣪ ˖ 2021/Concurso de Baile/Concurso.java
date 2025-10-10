public class Concurso {
    
    private Pareja[] parejas;
    private int dimensionLogica;
    private int dimensionFisica;
    
    public Concurso(int dimensionFisica){
        parejas = new Pareja[dimensionFisica];
        dimensionLogica = 0;
        this.dimensionFisica = dimensionFisica;
    }
    
    //- Agregar una pareja al concurso. Asuma que hay lugar.
    public void agregarPareja(Pareja pareja){
        this.parejas[dimensionLogica] = pareja;
        this.dimensionLogica = this.dimensionLogica + 1;
    }
    // - Obtener la pareja con más diferencia de edad del concurso.
    public Pareja obtenerParejaMayorDiferenciaDeEdad(){
        int diferenciaDeEdad = 0; int i;
        Pareja p = null;
        for (i = 0; i < dimensionLogica; i++){
            if (this.parejas[i].obtenerDiferenciaDeEdad() > diferenciaDeEdad){
                diferenciaDeEdad = this.parejas[i].obtenerDiferenciaDeEdad();
                p = this.parejas[i];
            }
        }
        return p;
    }
}
