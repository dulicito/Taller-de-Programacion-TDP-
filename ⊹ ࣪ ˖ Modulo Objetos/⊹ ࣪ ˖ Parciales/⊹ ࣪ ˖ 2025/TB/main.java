/*Representar alumnos de una materia y sus evaluaciones. Del alumno se registra: 
nombre, legajo y sus evaluaciones que son: 1 examen y 9 entregas (numeradas del 1
al 9).
De las evaluaciones examen se conoce: la fecha, docente evaluador, la nota obtenida 
en teoría y la nota obtenida en práctica.
De las evaluaciones entrega se conoce: la fecha, docente evaluador, la nota de 
presentación, la nota de contenido y la nota de originalidad.

1.Genere las clases necesarias. Provea constructores para iniciar las evaluaciones 
a partir de la información necesaria; al alumno recibiendo: nombre, legajo y 1 examen 
(inicialmente sin entregas).

2.Implemente los métodos necesarios, en las clases que corresponda, para:

a) Dado un número i y una entrega, registrar la entrega como la i-ésima presentada 
por el alumno. Asuma que i está entre 1 y 9.

b) Obtener la nota final de una evaluación, teniendo en cuenta que:

Para los exámenes: nota_final = nota_teoría * 0.4 + nota_práctica * 0.6

Para las entregas: la nota final surge de promediar las notas de presentación, 
contenido y originalidad.

c) Saber si una evaluación está aprobada, sabiendo que lo está si su nota final es
al menos 4.

d) Saber si el alumno está aprobado, sabiendo que lo está si su examen está aprobado 
y presentó al menos 3 entregas aprobadas.

Ejemplo:
Un alumno que aprobó su examen y su situación con las entregas es:
Entrega 1: aprobada
Entrega 2: no presentada
Entrega 3: aprobada
Entrega 4: no presentada
Entrega 5: reprobada
Entrega 6: aprobada
Entregas 7 a 9: no presentadas
→ Cumple y estará aprobado.

3.Realice un programa que instancie a un alumno. Registre al alumno algunas entregas. 
Imprima si el alumno está aprobado.*/

package TB;

public class main {

    public static void main(String[] args) {
        // instanciar un alumno
        Alumno a1 = new Alumno("Pepito","1239/3");
        
        //registrar al alguno algunas entregas 
        
        
        EvaluacionExamen e1 = new EvaluacionExamen(9,8,"10/10","Docente 1");
        EvaluacionEntrega e2 = new EvaluacionEntrega (9,2,3,"10/10","Docente 1");
        EvaluacionEntrega e3 = new EvaluacionEntrega (2,2,3,"10/10","Docente 1");
        EvaluacionEntrega e4 = new EvaluacionEntrega (9,9,3,"10/10","Docente 1");
        EvaluacionEntrega e5 = new EvaluacionEntrega (7,3,3,"10/10","Docente 1");
       
        
        a1.agregarEvaluacion(1, e2);
        a1.agregarEvaluacion(3, e3);
        a1.agregarEvaluacion(5, e4);
        a1.agregarEvaluacion(6, e5);
        
        //imprimir si esta aprobado 
        
        System.out.println(a1.saberSiAprobo());
    }
    
}
