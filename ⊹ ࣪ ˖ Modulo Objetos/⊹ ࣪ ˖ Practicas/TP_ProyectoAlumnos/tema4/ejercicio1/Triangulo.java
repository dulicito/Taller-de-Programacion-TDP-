
package tema4.ejercicio1;

public class Triangulo extends Figura{
    private double lado1;
    private double lado2;
    private double lado3;
    
    public Triangulo(double lado1, double lado2, double lado3, String colorRelleno, String colorLinea){
        super(colorRelleno,colorLinea);
        setLado1(lado1);
        setLado2(lado2);
        setLado3(lado3);
    }

    public double getLado1() {
        return lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    @Override
    public double calcularArea() {
        double a =(this.getLado1() + this.getLado2() + this.getLado3())/ 2;
        double aux = Math.sqrt(a*(a-this.getLado1())*(a-this.getLado2())*(a- this.getLado3()));
        return aux;
   }

    @Override
    public double calcularPerimetro() {
        return this.getLado1()+ this.getLado2()+this.getLado3();

    }
    
    
    
    
    
}
