/*se desea representar una empresa de informatica y sus programadores. la empresa 
tiene: nombre, un programador lider y a lo sumo N programadores. De los programadores 
se conoce: nombre, dni, sueldo basico, cantidad de lineas de codigo por hora y lenguaje 
de preferencia. adicionalmente, del programador lider se conoce:  antiguedad en años y 
cantidad de proyectos dirigidos.

1. genere las clase necesarias, provea constructores para iniciar: el programador lider, 
con capacidad para un maximo de N programadores (inicialmente sin programadores)

2. Implemente los metodos necesarios, en las clases que corresponda para:

a) dado un programador, agregarlo a la empresa

b) calcular el monto total en sueldos a abonar por la empresa, sabiendo que es la suma 
de los sueldos finales de todos los programadores de la empresa(incluido el lider). para 
cualquier programador, el sueldo final es el sueldo basico adicionando $50.000 si supera 
las 200 lineas de codigo por hora. ademas de eso, para el programador lider se adiciona 
$10.000 por año de antiguedad y $20.000 por proyecto dirigido.

c) dado un monto M, aumentar el sueldo basico de todos los programadores en M (incluido el lider)

d) retornar la representacion String de la empresa, siguiendo el ejemplo:

"Empresa: nombre. 
Programador lider: {nombre, dni, lenguaje de preferencia, sueldo final}
Programador 1: {nombre, dni, lenguaje de preferencia, sueldo final}
Programador 2: {nombre, dni, lenguaje de preferencia, sueldo final}
.....
Monto total en sueldos a abonar por la empresa: ...."

3) Realice un programa que instancie una empresa Informatica con un lider. agregue algunos 
programadores a la empresa, Aumente los sueldos basicos de todos los programadores de la 
empresa en un monto. Muestre la representacion toString de la empresa */

package parciales.TK;

import PaqueteLectura.GeneradorAleatorio;

public class Parciales {

    public static void main(String[] args) {
        // instancio el lider y los programadores
        ProgramadorLider boss;
        Programador programador1;
        Programador programador2;
        Programador programador3;
        
        GeneradorAleatorio.iniciar();
        //creo la empresa con n programadores
        boss = new ProgramadorLider(25,18,"Jefe",321312,200,60,".net");
        Empresa empresa = new Empresa("WINDOWS",boss,4);
        
        // cargo datos de los programadores
       programador1 = new Programador("Dulicito",284711,300,20,"C#");
       programador2  = new Programador("Matias",2932222,300,70,"Python");
       programador3 = new Programador("Sofia",2983213,900,10,"Ruby");
       
       //agrego programadores a la empresa
       
       empresa.agregarProgramador(programador1);
       empresa.agregarProgramador(programador2);
       empresa.agregarProgramador(programador3);
       
       //aumento sueldos de los programadores
       double monto= 1+ GeneradorAleatorio.generarDouble(20);
       empresa.aumentarSueldos(monto);
       
        // imprimo to string de la empresa 
       System.out.println(empresa.toString());
    }
    
}
