/*4- Sobre un nuevo programa, modifique el ejercicio anterior para considerar que:

a) Durante el proceso de inscripción se pida a cada persona sus datos (nombre, 
DNI, edad) y el día en que se quiere presentar al casting. La persona debe ser 
inscripta en ese día, en el siguiente turno disponible. En caso de no existir un 
turno en ese día, informe la situación.

La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 
40 cupos de casting.
Una vez finalizada la inscripción:

b) Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre 
de la persona a entrevistar en cada turno asignado */

package tema2;
// la linea import PaqueteLectura.*; me permite usar el lector y generar numeros aleatorios sin tener que declarar uno a uno. 
import PaqueteLectura.*;

/**
 *
 * @author sofia
 */
public class Ej04 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //declaracion variables y estructuras
        int dia = 5;
        int entrevistas = 8;
        int entrevistados = 0;
        
        Persona [][]entrevistado = new Persona [dia][entrevistas];
        int [] vectorDiml = new int [dia];
        
        GeneradorAleatorio.iniciar();
        
        //Inicializo vector y matriz 
        int i;
        for (i = 0; i < dia; i++){
            vectorDiml[i] = 0;
        }
        for (int f = 0; f < dia; f++) {
            for (int c = 0; c < vectorDiml[f]; c++) {
                entrevistado[f][c] = null;
            }
        }
        //cargo matriz 
        
        String nombre= GeneradorAleatorio.generarString(5);
        
        while (!nombre.equals("ZZZ")&& (entrevistados < (dia*entrevistas))){
            System.out.println("Ingrese un dia para anotarse(1 a 5): ");
            int diaAnotado = Lector.leerInt();
            
            
            if (vectorDiml[diaAnotado-1] < entrevistas){
                entrevistado[diaAnotado-1][vectorDiml[diaAnotado-1]++] = new Persona(nombre,GeneradorAleatorio.generarInt(20),GeneradorAleatorio.generarInt(50));
                entrevistados++;
            }
            else 
                System.out.println("No hay mas turnos disponibles en el dia actual");
            nombre = GeneradorAleatorio.generarString(5);
            
        }
        
        //imprimo matriz 
        
        //f = fila; c= columna
        
        for(int f = 0; f<= dia; f++){
            for (int c=0; c < vectorDiml[f];c++){
                System.out.println("Dia: "+(f+1)+ ", Entrevista: "+ (c+1)+",Contiene a la persona: "+ entrevistado[f][c].getNombre());
            }
            System.out.println("El dia: "+ f+ "Hubo "+ vectorDiml[f]+ "Inscriptos al casting. ");
        }
    }
    
}
