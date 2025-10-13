
package tema4.ejercicio1;

public class Circulo extends Figura {
    private double radio;
    
    public Circulo(double radio1, String colorRelleno, String colorLinea){
        super(colorRelleno,colorLinea);
        this.setRadio(radio1);
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    @Override
    public double calcularArea() {
        double aux = Math.PI* (this.radio * this.radio);
        return aux;
    }

    @Override
    public double calcularPerimetro() {
        double aux = 2* (Math.PI * this.radio);
        return aux;
    }

    @Override
    public String toString() {
        return super.toString() + " ,Radio: "+ this.radio;
    }
    
    
    
}
