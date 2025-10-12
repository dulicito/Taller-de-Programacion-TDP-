/*1-A- Definir una clase para representar triángulos. Un triángulo se caracteriza 
por el tamaño de sus 3 lados (double), el color de relleno (String) y el color de 
línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.

Provea métodos para:

- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)

B- Realizar un programa que instancie un triángulo, le cargue información leída desde
teclado e informe en consola el perímetro y el área.

NOTA: Calcular el área con la fórmula Área = √s(s − a)(s − b)(s − c) , donde a, b y c son
los lados y s =
𝐚+𝐛+𝐜
2
. La función raíz cuadrada es Math.sqrt(#)*/

package tema3;

import PaqueteLectura.Lector;

public class Ej01 {

    public static void main(String[] args) {
        
        //declaro las variables
        double lado1, lado2, lado3; 
        String colorRelleno, colorLinea; 
        
        System.out.println("Ingrese el primer lado del Triangulo: ");
        lado1 = Lector.leerDouble();
        
        System.out.println("Ingrese el segundo lado del Triangulo: ");
        lado2 = Lector.leerDouble();
        
        System.out.println("Ingrese el tercer lado del Triangulo: ");
        lado3 = Lector.leerDouble();
        
        System.out.println("Ingrese un color de Relleno: ");
        colorRelleno = Lector.leerString();
        
        System.out.println("Ingrese un color de Linea: ");
        colorLinea= Lector.leerString();
        
        //inicializo el objeto
        
        Triangulo triangulo = new Triangulo (lado1, lado2, lado3, colorRelleno, colorLinea);
        
        
        //imprimo su perimetro y area 
        System.out.println("Perimetro del Triangulo: "+ triangulo.calcularPerimetro());
        System.out.println("Area del Triangulo: "+ triangulo.calcularArea());
    }
    
}
