public abstract class Grupo {
    
    private String nombreInstructor;
    private double sueldoInstructor;
    private double costoInscripcion;
    private Chico[] chicosInscriptos;
    private int dimensionLogica;
    
    public Grupo(String nombreI, double sueldoI, double costoI, int dimensionFisica){
        this.nombreInstructor = nombreI;
        this.sueldoInstructor = sueldoI;
        this.costoInscripcion = costoI;
        chicosInscriptos = new Chico[dimensionFisica];
        this.dimensionLogica = 0;
    }
    
    public boolean agregarChico(Chico c){
        chicosInscriptos[dimensionLogica] = c;
        this.dimensionLogica = this.dimensionLogica + 1;
        return true;
    }
    
    //Obtener la ganancia neta del grupo, teniendo en cuenta que: es 
    //el costo de inscripción de los chicos anotados y a eso se resta el sueldo del instructor. 
    public double obtenerGananciaNeta(){
        return (this.costoInscripcion * this.dimensionLogica) - this.sueldoInstructor;
    }
    
    public String representacionDeGrupos(){
        String representacion = this.nombreInstructor + ", " + this.dimensionLogica + ": \n";
        int i;
        for (i = 0; i < dimensionLogica; i++){
            representacion += "Chico " + (i + 1) + ": " + chicosInscriptos[i].getNombre() + ", \n";
        }
        representacion += "Ganancia neta del grupo: " + this.obtenerGananciaNeta();
        return representacion;
    }
    
    public boolean esRentable(){
        return this.obtenerGananciaNeta() > 5000;
    }
}
