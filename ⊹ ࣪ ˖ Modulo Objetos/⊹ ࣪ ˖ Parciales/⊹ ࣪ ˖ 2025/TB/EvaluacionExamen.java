
package TB;


public class EvaluacionExamen extends Evaluacion {
        private double notaTeoria;
        private double notaPractica;
        
    
    
    //constructor
     public EvaluacionExamen(double notaTeoria, double notaPractica, String fecha, String docenteEvaluador) {
        super(fecha, docenteEvaluador);
        this.notaTeoria = notaTeoria;
        this.notaPractica = notaPractica;
    }       
        
        
        
    // metodo ABSTRACTO  obtener nota final de una evaluacion 
    //formula :  nota teoria * 0.4 + nota practico * 0.6 
    @Override
    public double obtenerNotaFinal() {
        double a = this.notaTeoria * 0.4;
        double b = this.notaPractica * 0.6;
        double aux = a+b;
        return aux;
        
    }        
     
        
        
   //metodo abstracto evaluacion aprobada 
    //sabiendo que lo esta si su nota es al menos 4

    @Override
    public boolean evaluacionAprobada(double nota) {
        double aux = this.obtenerNotaFinal();
        return super.evaluacionAprobada(aux); 
    }

        
        
        
}
