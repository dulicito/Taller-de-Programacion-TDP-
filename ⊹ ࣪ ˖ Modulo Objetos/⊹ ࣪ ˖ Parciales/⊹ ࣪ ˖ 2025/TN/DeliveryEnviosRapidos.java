
package TN;

/* nota: la clase debio llamarse DeliveryEnvioRapido, error a modificar dsp */

public class DeliveryEnviosRapidos extends Aplicacion {
    private Envio []envio;
    private int df;
    private int dl;
    
    
    //constructor
    // se crear un maximo de n envios, inicialmente sin envios efectuados
     public DeliveryEnviosRapidos( int df, String nombre, String direccionWeb) {
        super(nombre, direccionWeb);
        this.df = df;
        this.dl = 0;
        this.envio = new Envio[df];
      
        //inicializo vector
         for (int i = 0; i < this.df; i++) {
             this.envio[i] = null;
         }
    }   
    
    //getters/setters necesarios
    
    //metodos
    // metoo registrarPedidoEnvio() agrega un envio. el metodo debe retornar true
    //si pudo agregarse y false en caso contrario 
    
    public boolean registrarPedidoEnvio(Envio e){
        boolean aux = false;
        
        if (this.dl < this.df){
            this.envio[this.dl] = e;
            dl++;
            super.setCantidaddeUsuariosRegistrados(super.getCantidaddeUsuariosRegistrados()+1);
            aux = true;
        }else {
            aux = false;
        }
        return aux; 
    }
    
    //calcular cotizacion comercial 
    //la cotizacion es de $400 por cada envio realizado + lo recaudado 
    //por cada envio. lo recaudado se obtiene restando al monto cobrado al
    //cliente el costo operativo del envio 
    
    public double calcularCotizacionComercial(){
        
        //recorro el vector de envios 
        double montoRecaudoTotal = 0; 
        
        for (int i = 0; i < this.dl; i++) {
            double recaudoActual = this.envio[i].getMontoCobradoAlCliente() - this.envio[i].getCostoOperativoDelEnvio();
            montoRecaudoTotal+= recaudoActual;
        }
        double costoEnvio = 400*this.dl;
        double aux = costoEnvio + montoRecaudoTotal;
        return aux;
        //le meto la condicion y tuki 
        
    }
    
    //toString (si lo pide)
    //obtenerlo del super 

    @Override
    public String toString() {
        String aux = super.toString() + ",Cotizacion comercial: "+ calcularCotizacionComercial();
        return aux;
    }

}
