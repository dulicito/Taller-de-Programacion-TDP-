
package tema3;

public class Triangulo {
    
    // declaracion de caracteristicas 
    private double lado1; 
    private double lado2;
    private double lado3;
    private String oolorRelleno; 
    private String colorLinea;
    
    // constructor de la clase
    public Triangulo(double unLado1, double unLado2, double unLado3, String unColorRelleno, String unColorLinea) {
        lado1 = unLado1;
        lado2 = unLado2;
        lado3 = unLado3;
        oolorRelleno = unColorRelleno;
        colorLinea = unColorLinea;
    }
    
    public Triangulo(){
        
    }
    
    //GETTERS
    public double getLado1() {
        return lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public String getOolorRelleno() {
        return oolorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }
    
    //SETTERS 
    
    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    public void setOolorRelleno(String oolorRelleno) {
        this.oolorRelleno = oolorRelleno;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    // metodo que calcula perimetro y lo devuelve 
    
    public double calcularPerimetro(){
        double aux;
        aux = lado1 + lado2 + lado3;
        return aux;
    }
    
    //metodo que calcula area y lo devuelve 
    
    public double calcularArea(){
        double semi = calcularPerimetro()/2;
        double aux; 
        //aplicamos la formula 
        aux = Math.sqrt(semi*(semi-lado1)*(semi-lado2)*(semi-lado3));
        //retornamos el resultado guardado en aux
        return aux;
    }
    
}

