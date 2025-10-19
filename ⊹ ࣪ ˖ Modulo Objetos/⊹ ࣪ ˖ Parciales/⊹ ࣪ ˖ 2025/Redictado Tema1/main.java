
/*Una universidad necesita un sistema para administrar los exámenes finales rendidos 
por sus alumnos.La universidad maneja hasta un máximo de N alumnos, de los cuales 
desea conocer: nombre,apellido,y número de legajo (String).Un mismo alumno puede 
rendir hasta M exámenes diferentes.De cada examen se conoce: mes y año en que se rindió,
la calificación obtenida,y la modalidad del examen (escrito, oral, trabajo integrador, etc.).

1.Modele el problema generando las clases que considere necesarias, cada una con los 
constructores, estado, getters y setters que considere necesarios.

2.Implemente en las clases realizadas los métodos necesarios para incorporar la siguiente 
funcionalidad:

a) Agregar un nuevo alumno a la universidad (asuma que hay lugar).

b) Agregar un nuevo examen rendido por un alumno cuyo número de legajo se recibe por parámetro.
(El número de legajo recibido podría no pertenecer a ningún alumno. Asuma que hay lugar.)

c) Obtener la cantidad de exámenes rendidos en un determinado mes y año bajo cierta modalidad.
El mes, año y modalidad se reciben por parámetro.

d) Devolver el alumno que tiene el mejor promedio.


3. Implemente una main que:

*Cree una universidad para administrar 1000 alumnos.
*Simule el ingreso de dos alumnos (con máximo de 10 exámenes cada uno).
*Agregue dos exámenes rendidos a cada alumno.
*Imprima la cantidad de exámenes rendidos bajo una cierta modalidad, en un determinado mes 
y año (todos los datos leídos por teclado).
*Finalmente, imprima nombre y apellido del alumno con mejor promedio.*/

package redictadoT1;

public class main {
    public static void main(String[] args) {
        // instanciar una universidad para administrar 1000 alumnos
        Universidad uni = new Universidad (1000);
        
        //simular ingreso de alumnos con maximo de examenes de 10
        
        Alumno a1 = new Alumno("Persona1","Apellido1","123/4",10);
        Alumno a2 = new Alumno("Persona2","Apellido2","1238/4",10);

        
        // agregar dos examenes rendidos a cada alumno

        Examen e1 = new Examen (2,2025,9,"Online");
        Examen e2 = new Examen (1,2025,6,"Online");
        Examen e3 = new Examen (7,2025,3,"Online");
        Examen e4 = new Examen (5,2025,9,"Online");

        a1.agregarExamen("123/4", e1);
        a1.agregarExamen("123/4", e2);
        a2.agregarExamen("1238/4", e3);
        a2.agregarExamen("1238/4", e4);
        
        uni.agregarAlumno(a1);
        uni.agregarAlumno(a2);
        
        
        //imprimir la cantidad de examenes rendidos bajo cierta modalidad
        // en un determinado mes y año. todos los datos leidos por teclado
        
        System.out.println("Cantidad de examenes bajo cierta modalidad: "+uni.cantExamenDeterminado(3,2025,"Online"));
        
        System.out.println("-----------------------------------------------------");
        
        //imprimir nombre y apellido del alumno con mejor promedio 
        System.out.println("Alumno con mejor promedio: " +uni.alumnoMejorPromedio());
        
    }
    
}
