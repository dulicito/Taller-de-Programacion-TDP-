
package TO;

public abstract class Curso {
    private String nombre;
    private double costoInscripcion;
    private String fechadeComienzo;
    private Alumno[] alumno;
    private int DF;
    private int DL;
    
    
        //constructor
    //maximo de m alumnos inician sin alumnos cargados
     
    
    public Curso(String nombre, double costoInscripcion, String fechadeComienzo, int DF) {
        this.nombre = nombre;
        this.costoInscripcion = costoInscripcion;
        this.fechadeComienzo = fechadeComienzo;
        this.DF = DF;
        this.DL = 0;
        this.alumno = new Alumno[DF];
        
        //inicializo vector en null
        for (int i = 0; i < DF; i++) {
            this.alumno[i] = null;
            
        }
    }

    public Alumno getAlumno( int i ) {
        return this.alumno[i];
    }
    
    public String getNombre(){    
        return nombre;
    }

    public double getCostoInscripcion() {
        return costoInscripcion;
    }

    public int getDL() {
        return DL;
    }

    public String getFechadeComienzo() {
        return fechadeComienzo;
    }

    //metodos
    //inscribir un alumno al curso, agregandolo al mismo y retornar el numero
    //que indica su orden de inscripcion, asumir que hay lugar
    public int agregarAlumno(Alumno a) {
        int nroOrden;
        this.alumno[this.DL] = a;
        nroOrden = DL +1;
        DL++;
        return nroOrden;
    }
    
    
    // dado un valor A, obtener el A-esimo alumno inscripto en el curso.
    //asumir que A esta en un rango valido de posiciones
    
    
    public Alumno obtenerAlumno (int A){
       return this.alumno[A-1];
    }
    
    // dado el nombre de un alumno y una nota X, actualice el rendimiento del
    //alumno con dicho nombre. actualizar el rendimiento del alumno implica
    //aumentar en 1 la cantidad de tareas completadas y sumar al total la nota
    //x
    
    public void actualizarRendimiento (String nombre, int nota){
        int i = 0;
        boolean ok =false;
        
        while (i < this.DL && !ok){
            if (this.alumno[i].getNombre().equals(nombre)){
                //sumo una tarea
                int nueTarea = this.alumno[i].getCantTareasCompletas() + 1;
                this.alumno[i].setCantTareasCompletas(nueTarea);
                
                //sumo la nota 
                int nueNota = this.alumno[i].getSumaTotalNotasTareasCompletas() + nota;
                this.alumno[i].setSumaTotalNotasTareasCompletas(nueNota);
                
                //ok = true
                ok = true;
            }else {
                i++;
            }
            
        }
    }
    
public abstract Alumno alumnoMejorDesempeño();
            
    //re tornar un toString que represente el curso

    @Override
            
    public String toString() {
        String aux= "Curso: "+ this.getNombre() + "\n"
                + "Costo de inscripcion: " + this.getCostoInscripcion()+
                ", Fecha de comienzo: "+ this.getFechadeComienzo() +
                "El mejor alumno con mejor desempeño del curso es: "+ 
                alumnoMejorDesempeño();
        return aux;
    }

 



}
