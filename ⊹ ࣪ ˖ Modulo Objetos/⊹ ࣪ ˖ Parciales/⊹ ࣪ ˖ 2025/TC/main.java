/*Representar una empresa de alquiler de bauleras.
La empresa tiene nombre, dirección, costo por mes y mantiene una estructura que 
representa el espacio de almacenamiento con los sectores con bauleras (1..S sectores 
y 1..B bauleras por sector).
De cada cliente se conoce: dni, nombre, teléfono, localidad y si contrata seguro.

1.Genere las clases necesarias. Provea constructores para iniciar: La empresa a 
partir de una dirección, costo por mes y las dimensiones del espacio de almacenamiento 
(S y B) y sin clientes cargados.

2.Implemente los métodos necesarios, en las clases que corresponda, para:

a) Ingresar un cliente al almacén, teniendo en cuenta que los clientes primero 
completan el primer sector en lugares sucesivos, luego el segundo y así sucesivamente.

b) Listar los clientes de la localidad de Los Hornos que alquilan bauleras del sector X.
Se debe devolver un String con las representaciones de los mismos con el formato:
dni, nombre, teléfono, localidad, asegurado

c) Obtener el número del sector con más clientes que hayan contratado seguro.

d) Obtener un String que represente la empresa siguiendo el ejemplo:

Empresa: Nombre - Dirección; Costo por mes.
Sector 1:
Baulera 1: dni, nombre, teléfono, localidad, asegurado
Baulera 2: dni, nombre, teléfono, localidad, sin seguro

Sector 2:
...


Realice un programa que cree la empresa “Storage” con 5 sectores de 3 bauleras cada uno.
Simule el alquiler de varios clientes y compruebe el correcto funcionamiento de los métodos 
implementados.*/

package TC;

public class main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //instanciar empresa llamada Storage con 5 sectores y 3 bauleras cada uno 
        Empresa emp = new Empresa("Storage",5,3);
        Empresa emp2 = new Empresa("Av. Santa Fe",199,5,3);
        
        //simular alquier de varios clientes
        Cliente c1 = new Cliente(443232,"Marta","232232","Los Hornos",false);
        Cliente c2 = new Cliente(44732,"Carmen","232232","Zeballos",false);
        Cliente c3 = new Cliente(4467632,"Sofia","232232","Fcio Varela",true);
        Cliente c4 = new Cliente(44878732,"Julieta","232232","Hudson",false);
        Cliente c5 = new Cliente(44343432,"Anna","232232","Villa Vatteone",true);
       
        emp.ingresarClienteAlAlmacen(c1);
        emp.ingresarClienteAlAlmacen(c2);
        emp.ingresarClienteAlAlmacen(c3);
        emp.ingresarClienteAlAlmacen(c4);
        emp.ingresarClienteAlAlmacen(c5);

        //comprobar funcionamiento de los metodos del punto 2.
        System.out.println(emp.clientesHornos(1));
        System.out.println("------------------------------------");
        System.out.println(emp.sectorMasClientes());
        System.out.println("------------------------------------");
        System.out.println(emp.toString());
    }
    
}
