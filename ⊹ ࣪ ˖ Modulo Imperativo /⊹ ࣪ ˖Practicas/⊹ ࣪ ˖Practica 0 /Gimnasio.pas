{ un gimnasio necesita procesar las asistencias de sus clientes. cada
  asistencia tiene dia, mes, año, numero de cliente(entre 1 y 500) y la 
  actividad realizada(valor entre 1 y 5).
  a) implemente un modulo que retorne una lista de asistencia de clientes a
  un gimnasio. las asistencias dentro de la lista deben quedar ordenadas de 
  menor a mayor por numero de cliente. generar aleatoriamente los valores hasta
  generar un valor cero para el numero de cliente.
  b) implemente un modulo que reciba la lista generada en a) e imprima todos
  los valores de la lista en el mismo orden que estan almacenados.
  c) implemente un modulo que reciba la lista generada en a) y un numero de 
  cliente y retorne la cantidad de asistencias del cliente recibido. Mostrar
  el resultado desde el programa principal.
  d) implemente un modulo que reciba la lista generada en a) y retorne la 
  actividad con mayor cantidad de asistencias. Mostrar el resultado desde
  el programa principal.}

nota: esta mal ksjdjsdk, despues lo corrijo

program gimnasio;
const
    maxcli: 500;
    maxact: 5;
    maxdia: 31;
    maxmes: 12;
type
    dias: 1..maxdia;
    meses: 1..maxmes;
    clientes: 1..maxcli;
    acts: 1..maxact;
    Asistencia: record
        dia:dias;
        mes:meses;
        anio:integer;
        numcli:clientes;
        act: acts;
    end;
    listaclientes=  ^nodo
        nodo= record
            info:Asistencia;
            sig: listaclientes;
    vectoractividad: array[acts]of integer;
var
    l: listaclientes; v: vectoractividad; cant,num: integer; 
begin
  l:= nil; //inicializo la lista en nil 
  cant:= 0
  cargarlista(l,v)//modulo A , nota: inicializar vector en el modulo 
  imprimir(l)//modulo B 
  writeln('Ingrese un numero de cliente'); readln(num);
  asistenciasdelcliente(l,num,cant);//modulo C 
  writeln('la cantidad de asistencias del cliente:' ,num,', es',cant); //modulo C 
  writeln('la actividad con mayor asistencias es: ',max(v));
end.
