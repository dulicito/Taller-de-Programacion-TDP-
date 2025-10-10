public class Chico {
    
    private String nombre;
    private int telefono;
    private boolean sabeNadar;
    
    public Chico(String nombre, int telefono, boolean sabeNadar){
        this.nombre = nombre;
        this.telefono = telefono;
        this.sabeNadar = sabeNadar;
    }
    
    public String getNombre(){
        return this.nombre;
    }
    
    public boolean getSabeNadar(){
        return this.sabeNadar;
    }
}
