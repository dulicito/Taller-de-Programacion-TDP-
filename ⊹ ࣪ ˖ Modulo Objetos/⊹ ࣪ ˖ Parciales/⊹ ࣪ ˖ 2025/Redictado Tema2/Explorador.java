public class Explorador extends Grupo{
    
    private double costoDeAlquiler;
    
    public Explorador(String nombreI, double sueldoI, double costoI, int dimensionFisica, 
                double costoDeAlquiler){
        super(nombreI, sueldoI, costoI, dimensionFisica);
        this.costoDeAlquiler = costoDeAlquiler;
    }
    
    public double obtenerGananciaNeta(){
        double gananciaSuper = super.obtenerGananciaNeta();
        return gananciaSuper - this.costoDeAlquiler;
    }
    
}
