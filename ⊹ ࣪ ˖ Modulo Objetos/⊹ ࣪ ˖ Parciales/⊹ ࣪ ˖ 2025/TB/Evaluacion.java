
package TB;

public abstract class Evaluacion {
    private String fecha;
    private String docenteEvaluador;

    
    //CONSTRUCTOR
    public Evaluacion(String fecha, String docenteEvaluador) {
        this.fecha = fecha;
        this.docenteEvaluador = docenteEvaluador;
    }

    // metodo ABSTRACTO  obtener nota final de una evaluacion
    public abstract double obtenerNotaFinal();
    
    //metodo evaluacion aprobada 
    //sabiendo que lo esta si su nota es al menos 4
    
    public boolean evaluacionAprobada( double nota){
        boolean aux;
        if (nota >= 4){
            aux = true;
        }else {
            aux = false;
        }
        return aux;
    }
    
}
