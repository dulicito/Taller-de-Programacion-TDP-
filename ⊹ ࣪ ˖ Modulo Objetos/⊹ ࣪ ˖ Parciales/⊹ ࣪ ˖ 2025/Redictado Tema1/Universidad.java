
package redictadoT1;

public class Universidad {
    private Alumno[] alumno;
    private int DF;
    private int DL;
    
    //constructor
     public Universidad(int DF) {
        this.DF = DF;
        this.DL = 0;
        this.alumno = new Alumno[DF];
        
         for (int i = 0; i < this.DF; i++) {
             alumno[i] = null;
         }
    }   
    
    //getters/setters

    public Alumno getAlumno( int pos) {
        return alumno[pos];
    }
    
     
     
     
    //metodo agregar un nuevo alumno a la universidad, asumir que hay lugar 
    
     public void agregarAlumno(Alumno a){
         this.alumno[this.DL] = a;
         this.DL++;
     }
    
     //metodo obtener la cantidad de examenes rendidos en un determinado mes, año
    // y bajo cierta modalidad, el mes, año y la modalida se reciben por parametro
    
     public int cantExamenDeterminado( int mes, int anio, String modalidad){
         int cantExamenes = 0;
         for (int i = 0; i < this.DL; i++) {
              Alumno a = this.alumno[i];
               for (int j = 0; j < a.getDL(); j++) {
                    Examen ex = a.getExamen(j);
                    if (ex.getMes() == mes && ex.getAño() == anio && ex.getModalidadExamen().equals(modalidad)) {
                            cantExamenes++;
        }
    }
}
         return cantExamenes;
     }
     
     
     
    //metodo devolver el alumno que tiene mejor promedio
     public String alumnoMejorPromedio(){
         Alumno mejor = null;
         String aux = "";
         double maxProm = -1;
         
         for (int i = 0; i < this.DL; i++) {
             if (this.alumno[i].promedio() > maxProm ){
                 mejor = this.getAlumno(i);
                 maxProm = this.alumno[i].promedio();
             }
         }
         if (mejor != null){
                aux += mejor.toString();
         }
         return aux; 
     }
     
    //toString 

}
