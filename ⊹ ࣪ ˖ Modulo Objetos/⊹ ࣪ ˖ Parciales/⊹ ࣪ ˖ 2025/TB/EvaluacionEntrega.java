
package TB;

public class EvaluacionEntrega extends Evaluacion {
    private double notaPresentacion;
    private double notaContenido;
    private double notaOriginalidad;
    
    //constructor
    public EvaluacionEntrega(double notaPresentacion, double notaContenido, double notaOriginalidad, String fecha, String docenteEvaluador) {
        super(fecha, docenteEvaluador);
        this.notaPresentacion = notaPresentacion;
        this.notaContenido = notaContenido;
        this.notaOriginalidad = notaOriginalidad;
    }    
    
    
    // metodo ABSTRACTO  obtener nota final de una evaluacion 
    // formula :  promediar las notas de presentacion, contenido y originalidad 
    
    @Override
    public double obtenerNotaFinal(){
        double suma = this.notaContenido + this.notaPresentacion + this.notaOriginalidad;
        double prom = suma /3;
        return prom; 
    }

    
    
    
    // inciso 2. e 
    @Override
    public boolean evaluacionAprobada(double nota) {
        double total = this.obtenerNotaFinal();
        return super.evaluacionAprobada(total); 
    }
    
    

    
}
