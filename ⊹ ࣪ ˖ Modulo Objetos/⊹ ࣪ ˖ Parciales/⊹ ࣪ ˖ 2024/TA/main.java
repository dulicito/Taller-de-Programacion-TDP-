/*PARCIAL TA 

Zoom necesita implementar salas y salas restringidas por contraseña. de las salas 
se conoce: id, url, los participantes conectados(a lo sumo 300) y la cantidad de 
participantes rechazados por falta de espacio. las salas restringidas por contraseña 
almacenan ademas las contraseñas de la sala y la cantidad de participantes rechazados 
por contraseña incorrecta. los participantes se caracterizan por tener: nombre, email 
y contraseña ingresada.

1. genere las clases necesarias, provea constructores, cualquier sala debe iniciar 
con un id, una url, sin participantes y 0 rechazados por falta de espacio, ademas 
de eso, las salas restringidas por contraseña deben iniciar con una contraseña y 0 
rechazados por contraseña incorrecta. los participantes deben permitit iniciar de 
dos formas, (a) solo con nombre y email(y sin contraseña) o (b) con nombre, email 
y contraseña

2. implemente los metodos necesarios en las clases que corresponda para:
a) dado un participante. agregarlo a la sala. el participante se agrega si hay espacio, 
caso contrario se aumenta la cantidad de rechazados por falta de espacio, tenga en 
cuenta que ademas, la sala restringida por contraseña verifica antes que la contraseña 
ingresada del participante coincida con la de la sala, caso contrario, aumenta los 
rechazados por contraseña incorrecta.

b) reiniciar la sala, esto es: borra todos los participantes conectados y reinicia el 
contador de rechazados por falta de espacio, la sala restringida por contraseña, ademas, 
reinicia la cantidad de rechazados por contraseña incorrecta.

c) calcular la tasa de admision, siguiendo la formula: 
100*(cant_participantes_conectados/total_solicitudes). 
para cualquier sala, total_solicitudes es la suma de los participantes conectados y los 
rechazados por falta de espacio, las salas restringidas por contraseña sumar a lo anterior 
los rechazados por contraseña incorrecta

d) obtener un resumen String que represente las salas, que concatene id, url, el  nombre 
y el email de cada participante conectado y la tasa de admision.

3. realice un programa que instancie una sala y una sala restringida por contraseña. pruebe 
agregar algunos participantes para cada  una. al finalizar, muestre el resumen y reinicie cada sala*/

package parciales.TL;

public class main {

    public static void main(String[] args) {
        // instanciar sala normal y restringida
        Sala sala1 = new Sala(122,"zoom.com/sala1");
        SalaRestringida sala2 = new SalaRestringida(2321,"zoom.com/sala2");
        
        //agregar algunos participantes a cada una
        Participante p1 = new Participante("Dulicito","holaqtal@gmail.com",9999);
        Participante p2= new Participante ("Pepito","sdasd@gmail.com");
        Participante p3 = new Participante("aaaa","xosoado@gmail.com",1234);
        Participante p4 = new Participante ("aaq","dkasd@gmail.com");
        
        sala1.agregarParticipante(p1);
        sala1.agregarParticipante(p2);
        sala2.agregarParticipante(p3);
        sala2.agregarParticipante(p4);
        
        
        // mostrar toString de cada sala y reiniciar cada sala 
        System.out.println(sala1.toString());
        System.out.println(sala2.toString());
        
        sala1.reiniciarSala();
        sala2.reiniciarSala();
    }
    
}
