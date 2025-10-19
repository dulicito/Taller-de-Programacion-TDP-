
package TO;

public class Alumno {
    private String nombre;
    private int cantTareasCompletas;
    private int sumaTotalNotasTareasCompletas;
    
    
        //constructor
    public Alumno(String nombre) {
        this.nombre = nombre;
        this.cantTareasCompletas = 0;
        this.sumaTotalNotasTareasCompletas = 0;
    }   
     
    
    //getters setters
  
    //metodos
    
    //to string si lo pide 

    public String getNombre() {
        return nombre;
    }

    public int getCantTareasCompletas() {
        return cantTareasCompletas;
    }

    public int getSumaTotalNotasTareasCompletas() {
        return sumaTotalNotasTareasCompletas;
    }

    public void setCantTareasCompletas(int cantTareasCompletas) {
        this.cantTareasCompletas = cantTareasCompletas;
    }

    public void setSumaTotalNotasTareasCompletas(int sumaTotalNotasTareasCompletas) {
        this.sumaTotalNotasTareasCompletas = sumaTotalNotasTareasCompletas;
    }

    @Override
    public String toString() {
        return "Alumno{" + "nombre=" + nombre + ", cantTareasCompletas=" + cantTareasCompletas + ", sumaTotalNotasTareasCompletas=" + sumaTotalNotasTareasCompletas + '}';
    }




}
