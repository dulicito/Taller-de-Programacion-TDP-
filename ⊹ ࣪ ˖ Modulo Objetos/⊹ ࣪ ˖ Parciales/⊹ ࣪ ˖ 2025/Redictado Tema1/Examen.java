
package redictadoT1;

public class Examen {
    private int mes;
    private int año;
    private double calificacionObtenida;
    private String modalidadExamen;
    
    //constructor
     public Examen(int mes, int año, double calificacionObtenida, String modalidadExamen) {
        this.mes = mes;
        this.año = año;
        this.calificacionObtenida = calificacionObtenida;
        this.modalidadExamen = modalidadExamen;
    }   
     
    //getters/setters
    
    
   
     
    
    
    //toString 

    public int getMes() {
        return mes;
    }

    public int getAño() {
        return año;
    }

    public String getModalidadExamen() {
        return modalidadExamen;
    }

    public double getCalificacionObtenida() {
        return calificacionObtenida;
    }


    

}
    

