
package TN;

public class Envio {
    private String direccionOrigen;
    private String direccionDestino;
    private double montoCobradoAlCliente;
    private double costoOperativoDelEnvio;
    
    //constructor
    public Envio(String direccionOrigen, String direccionDestino, double montoCobradoAlCliente, double costoOperativoDelEnvio) {
        this.direccionOrigen = direccionOrigen;
        this.direccionDestino = direccionDestino;
        this.montoCobradoAlCliente = montoCobradoAlCliente;
        this.costoOperativoDelEnvio = costoOperativoDelEnvio;
    }
    
    
    //getters/setters necesarios
    
    //metodos
    //toString (si lo pide)

    public double getMontoCobradoAlCliente() {
        return montoCobradoAlCliente;
    }

    public double getCostoOperativoDelEnvio() {
        return costoOperativoDelEnvio;
    }


}
