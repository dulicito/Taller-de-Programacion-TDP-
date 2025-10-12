
package tema3.ejercicio4;

import PaqueteLectura.*;

public class Habitacion {
    private double costo;
    private boolean ocupada;
    private Cliente cliente;
    
    public Habitacion(){
        costo = GeneradorAleatorio.generarDouble(6000)+2000;
        ocupada=false;
        cliente = null;
    }

    public double getCosto() {
        return costo;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    public boolean estaOcupada(){
        return ocupada; 
    }
    
    public void ocupar (Cliente c){
        this.cliente = c;
        this.ocupada = true;
    }
    
    public void aumentarPrecio(double n){
        costo+=n;
    }

    @Override
    public String toString() {
        String aux = "Costo: "+costo+ ",Estado: "+ocupada;
        if (ocupada){
            aux+= cliente.toString();
        }
        return aux; 
    }
  
}
