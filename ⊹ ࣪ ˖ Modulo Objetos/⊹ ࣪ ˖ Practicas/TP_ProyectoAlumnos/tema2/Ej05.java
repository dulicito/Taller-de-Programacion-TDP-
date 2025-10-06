/*5- Se dispone de la clase Partido (en la carpeta tema2). Un objeto partido 
representa un encuentro entre dos equipos (local y visitante). Un objeto partido 
puede crearse sin valores iniciales o enviando en el mensaje de creación el nombre 
del equipo local, el nombre del visitante, la cantidad de goles del local y del 
visitante (en ese orden). Un objeto partido sabe responder a los siguientes mensajes:

*getLocal() retorna el nombre (String) del equipo local
*getVisitante() retorna el nombre (String) del equipo visitante
*getGolesLocal() retorna la cantidad de goles (int) del equipo local
*getGolesVisitante() retorna la cantidad de goles (int) del equipo visitante
*setLocal(X) modifica el nombre del equipo local al “String” X
*setVisitante(X) modifica el nombre del equipo visitante al “String” X
*setGolesLocal(X) modifica la cantidad de goles del equipo local al “int” X
*setGolesVisitante(X) modifica la cantidad de goles del equipo visitante al “int” X
*hayGanador() retorna un boolean que indica si hubo (true) o no hubo (false) ganador
*getGanador() retorna el nombre (String) del ganador del partido (si no hubo retorna
un String vacío).
*hayEmpate() retorna un boolean que indica si hubo (true) o no hubo (false) empate

Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en
el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga:

- Para cada partido, armar e informar una representación String del estilo:
{EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante }
- Calcular e informar la cantidad de partidos que ganó River.
- Calcular e informar el total de goles que realizó Boca jugando de local.*/

package tema2;

/**
 *
 * @author sofia
 */
/*el enunciado pide ingresar la informacion por teclado pero
para hacerlo mas rapido lo pruebo con generar aleatorio :") */

import PaqueteLectura.*;

public class Ej05 {
    
    public static void main(String[] args) {
            //cargo variables o inicializo 
            int df=20;
            Partido vec[]= new Partido[df];
            int diml = 0;
            GeneradorAleatorio.iniciar();
            
            //inicializo vector
            
            for (int i=0; i<df; i++){
                vec[i]= null;
            }
            //cargo vector 
            System.out.println("Ingrese el nombre del equipo visitante: ");
            String visitante= Lector.leerString();
            
            while (!visitante.equals("ZZZ") && (diml < 20)){
                System.out.println("Ingrese el nombre del equipo local: ");
                String loc = Lector.leerString();
                
                vec[diml] = new Partido(loc,visitante,GeneradorAleatorio.generarInt(9), GeneradorAleatorio.generarInt(9));
                
                System.out.println("Ingrese el nombre del equipo visitante: ");
                visitante= Lector.leerString();
            }
            
            //recorro vector & pregunto 
            
            int cantRiver = 0, cantBoca = 0;
            for (int i = 0; i < diml ; i++){
                if (vec[i].getGanador().equals("River"))
                    cantRiver++;
                if (vec[i].getLocal().equals("Boca"))
                    cantBoca += vec[i].getGolesLocal();
            }
            
            System.out.println("Partidos ganados por River: "+cantRiver);
            System.out.println("Cantidad de goles metidos por Boca(Local): "+cantBoca);
    }
    
}
