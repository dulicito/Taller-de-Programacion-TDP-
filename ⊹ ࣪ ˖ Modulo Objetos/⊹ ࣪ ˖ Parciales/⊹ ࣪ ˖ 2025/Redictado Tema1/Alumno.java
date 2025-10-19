
package redictadoT1;

public class Alumno {
    private String nombre;
    private String apellido;
    private String legajo;
    private Examen[] examen;
    private int DL;
    private int DF;
    
    
        //constructor
     public Alumno( String nombre, String apellido, String legajo, int DF) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.legajo = legajo;
        this.examen = new Examen[DF];
        this.DF = DF;
        this.DL = 0;
        
         for (int i = 0; i < this.DF; i++) {
             examen[i]= null;
         }
    }   
    
     
     
    //getters/setters
    public Examen getExamen(int pos) {
        return examen[pos];
    }

    public int getDL() {
        return DL;
    }
    
    
        
    //metodo agregar un nuevo examen rendido por un alumno cuyo legajo se 
    //recibe por parametro, el nro de legajo recibido podria no pertenecer
    //a ningun alumno, asuma que hay lugar
    public void agregarExamen(String legajo, Examen examen){
        if (this.legajo.equals(legajo)){
            this.examen[this.DL] = examen;
            this.DL++;
        }
    }
        
        
    public double promedio(){
        double suma = 0;
        for (int i = 0; i < this.DL; i++) {
            suma += this.examen[i].getCalificacionObtenida();
            
        }
        double prom = suma / this.DL;
        return prom;
    }
    
    //toString 

    @Override
    public String toString() {
        return "Alumno{" + "nombre=" + nombre + ", apellido=" + apellido +"}";
    }
    

}
