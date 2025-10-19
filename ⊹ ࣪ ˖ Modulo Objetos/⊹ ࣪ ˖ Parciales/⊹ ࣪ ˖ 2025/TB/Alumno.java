
package TB;

public class Alumno {
    private String nombre;
    private String legajo;
    private EvaluacionExamen examen;
    private EvaluacionEntrega[] entregas;
    private int DF = 9; 

 
    
    
    
    //GENERAR CONSTRUCTOR
    //parametros: nombre, legajo y 1 examen ,inicialmente sin entregas

    public Alumno(String nombre, String legajo) {
        this.nombre = nombre;
        this.legajo = legajo;
        this.examen = null;
        
        this.entregas = new EvaluacionEntrega[DF];
        
        //inicializar vector 
        for (int i = 0; i < this.DF; i++) {
            entregas[i] = null;
        }
    }
    
    // Dado un numero L y una entrega, registrar la entrega como la I-esima
    //presentada por el alumno, asuma que L esta entre L y 9 
    
    public void agregarEvaluacion (int L , EvaluacionEntrega entrega){
        this.entregas[L -1] = entrega;
        
    }
    
    //metodo saber si el alumno esta aprobado. 
    //sabiendo que lo esta si su examen esta aprobado y presento al menos 
    //3 entregas aprobadas
    /*ejemplo: un alumno que aprobo su examen y su situacion con las entregas
    es entrega 1: aprobada; entrega2: no presentada; entrega 3: aprobada; 
    entrega 4: no presentada; entrega 5: reprobada; entrega 6: aprobada
    entregas 7 a 9: no presentadas; cumple y estara aprobado */
    
    
    public Boolean saberSiAprobo(){
        int cantEntregas = 0;
        boolean aprobo=false;
        
        for (int i = 0; i < this.DF; i++) {
            if ( this.entregas[i] != null){
                if (this.entregas[i].evaluacionAprobada(this.entregas[i].obtenerNotaFinal())){
                    cantEntregas++;
                }
            }
        }
        
        if (this.examen !=  null){
            if (this.examen.evaluacionAprobada(this.examen.obtenerNotaFinal())){
                if (cantEntregas >= 3){
                    aprobo = true;
                }
            }
        }
        
        
        return aprobo;
    }
    
}
