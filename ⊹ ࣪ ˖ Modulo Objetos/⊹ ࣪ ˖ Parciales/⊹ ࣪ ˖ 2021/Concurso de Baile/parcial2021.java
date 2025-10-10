/*Modulo Objetos 18-03-2021
1. Representar un concurso de baile. El concurso tiene a lo sumo N parejas. 
Cada pareja tiene 2 participantes y un estilo de baile. De los participantes 
se tiene dni, nombre,edad.

a) Genere las clases necesarias. Provea constructores para iniciar: el concurso 
para un máximo de N parejas (inicialmente sin parejas cargadas); las parejas y 
los participantes a partir de toda su información.

b) Implemente métodos en las clases adecuadas para permitir:
b1) Agregar una pareja al concurso. Asuma que hay lugar.
b2) Obtener la diferencia de edad de la pareja.
b3) Obtener la pareja con más diferencia de edad del concurso.
2. Realice un programa que instancie un concurso, cargue 2 parejas y a partir 
del concurso muestre: los nombres de los participantes de la pareja con más 
diferencia de edad.*/

public class parcial2021 {
    public static void main(String[] args) {

        Concurso c = new Concurso(3);

        String estilo = "estilo1";

        Participantes p1 = new Participante(1234, "nombre1", 10);
        Participantes p2 = new Participante(4444, "nombre2", 20);

        Pareja p = new Pareja(estilo, p1, p2);

        c.agregarPareja(p);

        estilo = "estilo2";

        p1 = new Participante(4567, "nombre3", 30);
        p2 = new Participante(7890, "nombre4", 45);

        p = new Pareja(estilo, p1, p2);

        c.agregarPareja(p);

        Pareja pMayorDif = c.obtenerParejaMayorDiferenciaDeEdad();

        System.out.println("La pareja con mayor diferencia de edad es: " + pMayorDif.getEstiloDeBaile());
    }
    
}
