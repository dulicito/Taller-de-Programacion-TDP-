/*5-A- Definir una clase para representar círculos. Los círculos se caracterizan 
por su radio(double), el color de relleno (String) y el color de línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.

Provea métodos para:

- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)

B- Realizar un programa que instancie un círculo, le cargue información leída de teclado e
informe en consola el perímetro y el área.
NOTA: la constante PI es Math.PI*/
package tema3.ejercicio5;

import PaqueteLectura.*;
public class Ej05 {
    public static void main(String[] args) {
        //cargo informacion leida por teclado al circulo
        System.out.println("Ingrese la radio del circulo: ");
        double radio = Lector.leerDouble();
        
        System.out.println("Ingrese el color de relleno del circulo: ");
        String color = Lector.leerString();
        
        System.out.println("Ingrese el color de linea del circulo: ");
        String linea = Lector.leerString();
        
        Circulo circulo1= new Circulo(radio,color,linea);
        
        // informar por consola: perimetro y area
        
        System.out.println("El Perimetro del circulo es:  "+ circulo1.calcularPerimetro());
        System.out.println("El Area del circulo es:  "+ circulo1.calcularArea());

    }
    
}
