/*3- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.

a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.

Una vez finalizada la inscripción:

b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona. Pensar en la estructura de datos a utilizar. Para comparar
Strings use el método equals.*/

package tema2;

/**
 *
 * @author sofia
 */

import PaqueteLectura.GeneradorAleatorio;
public class Ej03 {

    public static void main(String[] args) {
        
        //declaracion variables y estructuras
        int dia = 5;
        int entrevistas = 8;
        int entrevistados = 0;
        int aux = 0;
        
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
            entrevistado[aux][vectorDiml[aux]++] = new Persona(nombre, GeneradorAleatorio.generarInt(30), GeneradorAleatorio.generarInt(59));
            if (vectorDiml [aux] == entrevistas && aux < (dia -1))
                aux++;
            
            nombre = GeneradorAleatorio.generarString(5);
            entrevistados++;
        }
        
        //imprimo matriz 
        
        //f = fila; c= columna
        
        for(int f = 0; f<= aux; f++){
            for (int c=0; c < vectorDiml[f];c++){
                System.out.println("Dia: "+f+ ", Entrevista: "+ c+",Contiene a la persona: "+ entrevistado[f][c].getNombre());
            }
        }
        
        
        
    }
    
}
