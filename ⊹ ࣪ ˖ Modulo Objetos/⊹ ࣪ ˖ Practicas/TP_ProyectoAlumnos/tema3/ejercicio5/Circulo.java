
package tema3.ejercicio5;

public class Circulo {
    private double radio;
    private String colorRelleno;
    private String colorLinea;
    
    public Circulo (double unRadio, String unColorRelleno, String unColorLinea) {
        radio = unRadio;
        colorRelleno = unColorRelleno;
        colorLinea = unColorLinea;
    }

    public double getRadio() {
        return radio;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    public double calcularPerimetro(){
        double aux = 2*radio*Math.PI;
        return aux;
    }
    
    public double calcularArea(){
        double aux= Math.PI * (radio*radio);
        return aux;
    }
}
