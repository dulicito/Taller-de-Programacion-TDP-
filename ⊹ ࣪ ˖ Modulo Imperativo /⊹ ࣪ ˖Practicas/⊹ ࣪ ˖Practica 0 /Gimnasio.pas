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


program gimnasio;
const
    maxcli: 500;
    maxact: 5;
    maxdia: 31;
    maxmes: 12;
type
    dias: 1..maxdia;
    meses: 1..maxmes;
    clientes: 0..maxcli; //nota: incluye desde el 0 por el corte de control del inciso a
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
    
{
retornar: lista de asistencias
debe quedar ordenadas de menor a mayor por numero de cliente
generar los valores aleatoriamente hasta que numero de cliente = 0
*  en eso usar un while }

procedure cargarlista (var l:lista; var v:vectoractividad) //INCISO A
var
	r:Asistencia;
begin
	inicializarvector(v);
	leerregistro(r); 
	while (r.numcli <> 0)do begin
		v[r.act]:= v[r.act] + 1;
	    insertarordenado(l,r);
	    leerregistro(r);
	end;
	
end;

procedure imprimir (l:lista) //MODULO B 
begin
	while (l<> nil)do begin
		imprimirregistro(l^.info); //le paso el registro como parametro 
		l:= l^.sig;
	end;

function asistenciasdelcliente(l:lista; num:integer):integer; //MODULO C
var
	ok: boolean; cant:integer;
begin
	cant:= 0;
	while(l<>nil) do begin
		if (l^.info.numcli = num) then 
			cant:= cant + 1;
		l:= l^.sig;
	end;
	asistenciasdelcliente:= cant;
end;

function max(v:vector):integer; //MODULO D
var
	i,maxx:integer;
begin
	for i:= 1 to 5 to begin
		if (v[i] > maxx)then
			maxx:= v[i];
	end;
	max:= maxx;
end;

var
    l: listaclientes; v: vectoractividad; cant,num: integer; 
begin
  l:= nil; //inicializo la lista en nil 
  cant:= 0
  cargarlista(l,v)//modulo A , nota: inicializar vector en el modulo 
  imprimir(l)//modulo B 
  writeln('Ingrese un numero de cliente'); readln(num);
  writeln('la cantidad de asistencias del cliente:' ,num,', es',asistenciasdelcliente(l,num,cant); //modulo C 
  writeln('la actividad con mayor asistencias es: ',max(v));//modulo D 
end.
