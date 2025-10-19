/*una plataforma de cursos online necesita representar sus cursos y sus alumnos 
incriptos. de un curso se conoce: nombre, costo de inscripcion, fecha de comienzo 
y la informacion de sus alumnos(a lo sumo M.) de un alumno se guarda: nombre,
cantidad de tareas completadas y suma total de notas de tareas completadas. 
ademas, hay dos tipos de cursos: basico y avanzado, que difieren en la manera de 
obtener el alumno con mejor desempeño, esto se detalla mas adelante. ademas del 
curso avanzado se registra la descripcion(string) de conocimientos previos que el 
alumno debe poseer.

1) genere las clases, provea constructores para crear objetos del modelo a partir 
de los datos necesarios: en particular, los cursos deben permitir un maximo de 
alumnos(sin alumnos cargados) ;los alumnis inician con su cantidad de tareas y 
la suma de notas a 0

2) implemente los metodos necesarios, en las clases que corresponda para:

a) inscribir un alumno al curso, agregandolo al mismo y retornar el numero que 
indica su orden de inscripcion. asuma que hay lugar. Ejemplo: el primer inscripto 
tendra numero de orden 1, el siguiente 2 y asi siguiendo.

b) dado un valor A, obtener el A-esimo alumno inscrito en el curso. Asuma que A 
esta en un rango valido de posiciones

c) dado el nombre de un alumno y una nota X, actualice el rendimiento del alumno 
con dicho nombre.actualizar el rendimiento del alumno implica: aumentar en 1 la 
cantidad de tareas completadas y sumar al total la nota x

d) retornar un tostring que represente el curso, concatenando: el nombre, costo 
de inscripcion, fecha de comienzo y todos los datos del alumno con mejor 
desempeño del curso, segun corresponda:
-En el curso basico, el alumno con mejor desempeño es aquel que tiene mayor 
cantidad de tareas completadas
-En el curso avanzado, el alumno con mejor desempeño es aquel que tiene mayor 
promedio. el promedio del alumno se calcula como suma_total_notas_completadas/cant_tareas_completadas.

3) realice un programa que instancie un curso basico y un curso avanzado. inscriba 
algunos alumnos a cada uno. actualice el rendimiento de algunos alumnos de cada 
curso. compruebe el correcto funcionamiento del metodo 2.d*/


package TO;

public class Main {

    public static void main(String[] args) {
        //instanciar un curso basico y un curso avanzado
        CursoBasico curso1 = new CursoBasico("Java Principiantes",1232,"19/2/2025",50);
        
        CursoAvanzado curso2 = new CursoAvanzado("estructura basica","Java Avanzados",1234,"20/2/2025",40);
       
        //inscribir algunos alumnos a cada uno
        Alumno a1 = new Alumno ("Sofia");
        Alumno a2 = new Alumno ("Anna");
        
        Alumno a3 = new Alumno ("Kay");
        Alumno a4 = new Alumno ("Zian");
        
        curso1.agregarAlumno(a1);
        curso1.agregarAlumno(a2);
        
        curso2.agregarAlumno(a3);
        curso2.agregarAlumno(a4);
        
        //actualizar el rendimiento de algunos alumnos de cada curso 
        curso1.actualizarRendimiento("Sofia",5);
        curso2.actualizarRendimiento("Anna",10);
        curso2.actualizarRendimiento("Kay",3);
        curso2.actualizarRendimiento("Zian",9);
        
        // to string de ambos cursos 
        System.out.println(curso1.toString());
        System.out.println(curso2.toString());
    }
    
}
