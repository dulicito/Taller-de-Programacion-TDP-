
package TC;

public class Cliente {
    private int dni;
    private String nombre;
    private String telefono;
    private String localidad;
    private boolean seguroAdicional;

    public Cliente(int dni, String nombre, String telefono, String localidad, boolean seguroAdicional) {
        this.dni = dni;
        this.nombre = nombre;
        this.telefono = telefono;
        this.localidad = localidad;
        this.seguroAdicional = seguroAdicional;
    }

    public String getLocalidad() {
        return localidad;
    }
    
    
    //tostring {dni, nombre, telefono, localidad, asegurado}

    public boolean tieneSeguro() {
       return this.seguroAdicional;
    }
    
    public String seguro (){
        String aux;
        if (this.seguroAdicional == true){
            aux = "Tiene seguro";
        }
        else{
            aux = "No tiene seguro";
        }
        return aux;
    }
    
    @Override
    public String toString() {
        String aux = "{"+ this.dni+ ","+this.nombre+","+this.telefono+","+this.localidad+","+seguro()+"}";
                return aux;
    }
    
}
