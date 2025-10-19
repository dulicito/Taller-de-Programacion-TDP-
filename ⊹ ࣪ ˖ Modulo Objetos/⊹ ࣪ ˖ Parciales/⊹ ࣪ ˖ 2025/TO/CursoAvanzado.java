
package TO;

public class CursoAvanzado extends Curso {
    private String descripcion; 
    
    
    //constructor
    public CursoAvanzado(String descripcion, String nombre, double costoInscripcion, String fechadeComienzo, int DF) {
        super(nombre, costoInscripcion, fechadeComienzo, DF);
        this.descripcion = descripcion;
    }
    //getters setters
    
    //metodos
    public int agregarAlumno(Alumno a) {
        return super.agregarAlumno(a);
    }

    @Override
    public void actualizarRendimiento(String nombre, int nota) {
        super.actualizarRendimiento(nombre, nota); 
    }
  
    
    //to string si lo pide 

    @Override
    
    public Alumno alumnoMejorDesempeño() {
        Alumno mejor= null;
        double maxPromedio = -1;
        
        for (int i = 0; i < super.getDL() ; i++) {
            Alumno actual = super.getAlumno(i);
            
            if ( actual !=null && actual.getCantTareasCompletas() > 0){
                double promedio = (double)actual.getSumaTotalNotasTareasCompletas() /actual.getCantTareasCompletas();
                
                if (promedio > maxPromedio){
                    maxPromedio = promedio;
                    mejor = actual;
                }
            }
        }
        return mejor;
    }




}
