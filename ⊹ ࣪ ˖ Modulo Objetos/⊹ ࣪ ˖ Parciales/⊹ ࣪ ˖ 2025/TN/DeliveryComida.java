
package TN;

public class DeliveryComida extends Aplicacion {
    private int cantPedidosRealizados;
    private double montoRecaudado;
    private int cantRestaurantesAsociados;
    
    //constructor
    //se inicializa los pedidos realizados con 0
    public DeliveryComida(int cantPedidosRealizados, int cantRestaurantesAsociados, String nombre, String direccionWeb) {
        super(nombre, direccionWeb);
        this.cantPedidosRealizados = 0;
        this.montoRecaudado = 0;
        this.cantRestaurantesAsociados = cantRestaurantesAsociados;
    }    
    public int getCantPedidosRealizados( ){    
        return cantPedidosRealizados;
    }
    //getters/setters necesarios
    public double getMontoRecaudado() {    
        return montoRecaudado;
    }

    public void setCantPedidosRealizados(int cantPedidosRealizados) {
        this.cantPedidosRealizados = cantPedidosRealizados;
    }

    public void setMontoRecaudado(double montoRecaudado) {
        this.montoRecaudado = montoRecaudado;
    }

    
    //metodos
    //metodo registrarPedidoComida()recibe un monto m e incrementa en m el monto
    //recaudado y en 1 la cantidad de pedidos realizados
    
    public void registrarPedidoComida(double M) {
        double montoActual = this.getMontoRecaudado() + M;
        this.setMontoRecaudado(montoActual);
        
        int pedidosActual = this.getCantPedidosRealizados() + 1;
        this.setCantPedidosRealizados(pedidosActual);
       }
                
                
   //metodo calcularCotizacionComercial() retorna la cotizacion comercial,
   //determinada de la siguiente forma
   //la cotizacion es de $500 por cada restaurante asociado + $50 por
  //cada usuario registrado + monto recaudado
                
    @Override
    public double calcularCotizacionComercial(){
        double aux = 500*cantRestaurantesAsociados + 50* super.getCantidaddeUsuariosRegistrados()+this.montoRecaudado;
        return aux; 
    }

    //toString (si lo pide)
    //obtenerlo del super

    @Override
    public String toString() {
        String aux = super.toString() + "Cotizacion comercial: " + calcularCotizacionComercial();
        return aux; 
       }
    }
