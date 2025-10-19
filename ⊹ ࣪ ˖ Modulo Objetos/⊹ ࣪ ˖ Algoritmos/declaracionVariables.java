public class Demo01DeclaracionVariables {
    public static void main(String[] args) {
        boolean encontre = false; //1
        int miDNI = 11222333, tuDNI = 10555444; //2
        char sexo, inicial = 'C'; //3
        sexo = 'F'; //4
        double miSueldo = 1000.30; //5
        String miNombre = "Pepe"; //6
}
}

public class Demo02OperadoresUnarios {
    public static void main(String[] args) {
        int i = 3; // i vale 3
        i++; // i vale 4
        i--; // i vale 3
    }
}

public class Demo03CalculoAritmeticoA{
    public static void main (String[] args) {
        int result = 1 + 2; // result es 3
        result = result - 1; // result es 2
        result = result * 2; // result es 4
        result = result / 2; // result es 2
        result = result % 2; // result es 0
    }   
}

public class Demo03CalculoAritmeticoB{
    public static void main (String[] args) {
        int i = 4/3; // División entera i = 1
        double d1 = 4.0/3.0; // División real d1 = 1.3333
        double d2 = 4/3; // División entera d2 = 1.0
        double d3 = (double) 4/3; // División real d3 = 1.333
    }
}