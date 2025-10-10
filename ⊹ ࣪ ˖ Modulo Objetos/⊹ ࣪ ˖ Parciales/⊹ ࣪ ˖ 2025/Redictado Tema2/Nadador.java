public class Nadador extends Grupo{
    private String nombre;
    private double sueldoDelBañero;
    
    public Nadador(String nombreI, double sueldoI, double costoI, int dimensionFisica, 
                String nombre, double sueldoB){
        super(nombreI, sueldoI, costoI, dimensionFisica);
         this.nombre = nombre;
         this.sueldoDelBañero = sueldoB;
    }
    
    public double obtenerGananciaNeta(){
        double gananciaSuper = super.obtenerGananciaNeta();
        return gananciaSuper - this.sueldoDelBañero;
    }
    
    public boolean agregarChico(Chico c){
        if (c.getSabeNadar()){
            super.agregarChico(c);
        }
        return false;
    }
    
}
