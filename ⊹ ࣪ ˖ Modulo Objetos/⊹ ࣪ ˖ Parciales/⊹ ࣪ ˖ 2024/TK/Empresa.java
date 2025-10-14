
package parciales.TK;

public class Empresa {
    private String nombre;
    private ProgramadorLider lider;
    private Programador [] programadores;
    private int DF;
    private int DL;

   // CONSTRUCTOR 
    public Empresa(String nombre, ProgramadorLider lider, int dimf) {
        this.nombre = nombre;
        this.lider = lider;
        this.programadores = new Programador[dimf];
        this.DF = dimf;
        this.DL = 0;
        
        //inicializo vector manualmente 
        for (int i = 0; i < dimf; i++) {
            programadores[i] = null;
        }
    }   
    
    //GETTERS Y/O SETTERS NECESARIOS
    
    //AGREGAR PROGRAMADOR
    
    public boolean agregarProgramador( Programador p){
        if (DL < DF ){
            programadores[DL] = p;
            DL++;
            return true;
        }else {
            return false;
        }
    }
    
    //MONTO TOTAL SUELDOS
    
    public double montoTotalSueldos(){
        //calcula el lider primero 
        double total = lider.calcularSueldoFinal();
        
        //calcula los programadores
        for (int i = 0; i < DL ; i++){
            total += programadores[i].calcularSueldoFinal();
        }
        return total; 
    }
    
    
    //AUMENTAR SUELDOS
    public void aumentarSueldos(double monto){
        lider.aumentarSueldoBasico(monto);
        for (int i = 0; i < DL; i++){
            programadores[i].aumentarSueldoBasico(monto);
        }
    }
    
    // TOSTRING 

@Override
    public String toString(){
        String aux;
        aux = "Empresa:"+ this.nombre +"\n"
        + "Programador Lider: "+ this.lider.toString() + "\n";
       for(int i = 0; i < DL ; i++){
           aux+= "Programador nro "+(i+1)+":" +this.programadores[i].toString() + "\n";
       }
       aux += "Monto total a abonar por la empresa: "+ montoTotalSueldos();
       return aux; 
    }

  
    
    
}
