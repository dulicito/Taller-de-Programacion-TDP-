{una empresa de turismo necesita un sistema para manejar las reservas
de sus cabañas durante el año 2026.

a) implementar un modulo que lea informacion de las reservas de las 
cabañas y retorne un vector que agrupe dichas reservas de acuerdo al 
nro de cabaña. para cada cabaña, las reservas deben quedar almacenadas
en un arbol binario de busqueda ordenado por dni de la persona que la 
reservo,

de cada reserva se lee: dni del titular, dia reserva, mes reserva, 
cantidad de dias reservados y codigo de cabaña(1..20). la lectura 
finaliza con "cantidad de dias reservados" igual a 0

b) realizar un modulo que reciba la estructura generada en a) y retorne
cual es la cabaña que tiene mas cantidad de dias reservados.

c) realizar un modulo que reciba la estructura generada en a), un dni D1
,un dni D2 y retorne la cantidad de reservas realizadas entre todas las
cabañas por los dni mayores que D1 y menores que D2.}


{a) reserva es un REGISTRO
		campos: dni_titular, dia_reserva,mes_reserva,cantdias_reserva,codigo_cabania(1..20)
	corte: cantdias_reserva = 0
	
	vector= de tipo ARBOLCabanias(1..20)
		tiene campos: dni, dia,mes,cantdias.}
		
{b) parametros: arbol, maxcant dias reservados, 
	devolver: nro de cabaña con max cantidad de dias reservados}

{c) parametros: arbol, D1, D2 (dnis)
	retornar: cantidad de reservas realizadas entre todas las cabañas dentro del rango D1-D2 
	modulo function }
		
program TJ2025;
type
	rangocodigocab=1..20;
	
	reserva=Record
		dni_titular:integer;
		dia_reserva:integer;
		mes_reserva:integer;
		cantdias_reserva:integer;
		codigo_cabania:rangocodigocab;
	end;
	
	reservas=record
		dni:integer;
		dia:integer;
		mes:integer;
		cantdias:integer;
	end;
	
	arbol=^nodoarbol;
		nodoarbol=Record
			info:reservas;
			hi:arbol;
			hd:arbol;
		end;
		
	vector=array[rangocodigocab] of arbol;

{a) reserva es un REGISTRO
		campos: dni_titular, dia_reserva,mes_reserva,cantdias_reserva,codigo_cabania(1..20)
	corte: cantdias_reserva = 0
	
	vector= de tipo ARBOLCabanias(1..20)
		tiene campos: dni, dia,mes,cantdias.}
		
procedure leerReserva(var r:reserva);
begin
	r.cantdias_reserva:= random(32);
	if (r.cantdias_reserva <>0)then begin
		r.dni_titular:= random(70)+1;
		r.dia_reserva:= random(31)+1;
		r.mes_reserva:= random(12)+1;
		r.codigo_cabania:= random(20)+1;
	end;
end;

procedure inicializarVector(var v:Vector);
var
	i:integer;
begin
	for i:= 1 to 20 do 
		v[i]:= nil;
end;
	
		
procedure agregarReserva(var a:Arbol; r:reserva); //CHEQUEAR A LO ULTIMO 
begin
	if (a = nil) then begin
		new(a);
		a^.info.dni:= r.dni_titular;
		a^.info.dia:= r.dia_reserva;
		a^.info.mes:= r.mes_reserva;
		a^.info.cantdias:= r.cantdias_reserva;
		a^.hi:= nil;
		a^.hd:= nil
	end
	else if (r.dni_titular <= a^.info.dni)then agregarReserva(a^.hi,r)
		else agregarReserva(a^.hd,r);
end;

procedure generarEstructura(var v:Vector);
var
	r:reserva;
begin
	leerReserva(r);
	while (r.cantdias_reserva <> 0)do begin
		agregarReserva(v[r.codigo_cabania],r);
		leerReserva(r);
	end;
end;

{b) parametros: vector, maxcant dias reservados, 
	devolver: nro de cabaña con max cantidad de dias reservados
	modulo function  }

		
function sumaDiasArbol(a: arbol): integer;
begin
  if a = nil then sumaDiasArbol := 0
  else sumaDiasArbol := a^.info.cantdias
                       + sumaDiasArbol(a^.hi)
                       + sumaDiasArbol(a^.hd);
                       
end; 

function cabaniamax(v: vector): integer;
var
	i, dias, maxdias, maxcab: integer;
begin	
	maxdias := -1;
    maxcab := 0;
    for i := 1 to 20 do begin
      dias := sumaDiasArbol(v[i]);
      if (dias > maxdias) then begin
        maxdias := dias;
        maxcab := i;
      end;
    end;
    cabaniamax := maxcab;
end;

{c) parametros: vector, D1, D2 (dnis)
	retornar: cantidad de reservas realizadas entre todas las cabañas dentro del rango D1-D2 
	modulo function }
	
procedure recorrerentreSubrango(a: arbol; d1, d2: integer; var cant: integer);
begin
  if a = nil then exit;
  if (a^.info.dni > d1) then recorrerentreSubrango(a^.hi, d1, d2, cant);
  if (a^.info.dni > d1) and (a^.info.dni < d2) then inc(cant);
  if (a^.info.dni < d2) then recorrerentreSubrango(a^.hd, d1, d2, cant);
end;



function cantrango(v:vector; d1,d2:integer):integer;
var
	i,cant:integer;
begin
	cant := 0;
	for i:=1 to 20 do
		recorrerentreSubrango(v[i], d1, d2, cant);
	cantrango := cant;
end;



procedure imprimirArbol(a:Arbol);
begin
	if (a <> nil)then begin
		imprimirArbol(a^.hi);
		writeln('dni: ',a^.info.dni);
		writeln('dia: ',a^.info.dia);
		writeln('mes: ',a^.info.mes);
		writeln('cantidad de dias: ',a^.info.cantdias);
		writeln('----------------');
		imprimirArbol(a^.hd);
	end;
end;
procedure imprimirVector(v:Vector);
var
	i:integer; act:arbol;
begin
	for i:= 1 to 20 do begin
		act:= v[i];
		imprimirArbol(act);
		writeln('-----------------------------');
	end;
end;


var
	v:Vector; d1,d2:integer; maxCab:integer;
begin
	//INCISO A 
	randomize;
	generarEstructura(v);
	imprimirVector(v); //SOLO PARA VERIFICAR 
	//INCISO B 
	maxCab:= cabaniamax(v);
	writeln('el numero de cabana con la cantidad maxima de dias reservados fue: ',maxCab);
	
	//INCISO C
	writeln('Ingrese el primer DNI para buscar en el rango: '); readln(d1);
	writeln('Ingrese el segundo DNI para buscar en el rango: '); readln(d2);
	writeln('la cantidad de reservas realizadas entre el rango ingresado fue de: ',cantrango(v,d1,d2));
end.
