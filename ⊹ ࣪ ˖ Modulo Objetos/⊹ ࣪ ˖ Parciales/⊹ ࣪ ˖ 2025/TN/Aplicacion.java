
package TN;

public abstract class Aplicacion {
    private String nombre;
    private String direccionWeb;
    private int cantidaddeUsuariosRegistrados;
    
    //constructor
    //las aplicaciones se crean con 0 usuarios registrados, 
    public Aplicacion(String nombre, String direccionWeb) {
        this.nombre = nombre;
        this.direccionWeb = direccionWeb;
        this.cantidaddeUsuariosRegistrados = 0;
    }    
    
    //getters/setters necesarios

    public int getCantidaddeUsuariosRegistrados() {
        return cantidaddeUsuariosRegistrados;
    }

    public void setCantidaddeUsuariosRegistrados(int cantidaddeUsuariosRegistrados) {
        this.cantidaddeUsuariosRegistrados = cantidaddeUsuariosRegistrados;
    }
    
    
    
    //metodos
    //metodo abstracto calcularCotizacionComercial()
    public abstract double calcularCotizacionComercial();
    
    
    
    
    //toString (si lo pide)
    //"Nombre; direccion web; cantidad de usuarios:; cotizacion comercial

    @Override
    public String toString() {
        String aux = " Nombre: "+ this.nombre +"\n"+
                "Direccion Web:"+ this.direccionWeb +"\n"+
                "Cantidad de Usuarios: "+ this.cantidaddeUsuariosRegistrados + "\n";
        
        return aux;
                
   }
    

}
