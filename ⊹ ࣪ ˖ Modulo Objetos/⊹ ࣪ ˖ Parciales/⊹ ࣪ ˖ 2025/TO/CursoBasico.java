
package TO;

public class CursoBasico extends Curso {

    //constructor
    public CursoBasico(String nombre, double costoInscripcion, String fechadeComienzo, int DF) {
        super(nombre, costoInscripcion, fechadeComienzo, DF);
    }
    
 
    //getters setters
    
    //metodos
    
    @Override
    public int agregarAlumno(Alumno a) {
        return super.agregarAlumno(a); 
    }

    @Override
    public void actualizarRendimiento(String nombre, int nota) {
        super.actualizarRendimiento(nombre, nota); 
    }
    
    public Alumno alumnoMejorDesempeño(){
        //creo al alumno vacio para guardar despues y max inicio en el menor posible
        Alumno mejor = null;
        int max = -1;
        
        //recorro el vector de alumnos
        for (int i = 0; i < super.getDL() ; i++) {
            Alumno actual = super.getAlumno(i);
            if (actual != null && actual.getCantTareasCompletas() > max){
                max = actual.getCantTareasCompletas();
                mejor = actual; 
            }
        }
        return mejor;
    }



    
    
    
}
