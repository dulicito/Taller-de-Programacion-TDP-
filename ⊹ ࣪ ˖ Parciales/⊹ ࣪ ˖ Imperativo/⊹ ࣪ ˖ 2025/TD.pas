{Latam necesita procesar los pasajes vendidos en agosto de 2025. de cada 
pasaje se conoce el codigo de vuelo,dia dni del cliente, codigo ciudad 
destino y monto del pasaje

a) implementar un modulo que lea pasajes, genere y retorne un arbol 
binario de busqueda por codigo de ciudad destino y almacene una lista 
con los pasajes(codigo de vuelo, dni del cliente y monto del pasaje) 
correspondientes. la lectura finaliza con dni 0. se sugiere utilizar el 
modulo leerPasaje().

b) implementar un modulo que reciba la estructura generada en a), dos
codigos y un valor entero. el modulo debe retornar la cantidad de vuelos 
que realizo el cliente con dni igual al valor ingresado cuyo codigo de 
destino esta entre los dos codigos ingresados(no incluirlos)

c) realizar un modulo que reciba la estructura generada en a). el modulo 
debe retornar el monto total acumulado en cada dia del mes

nota: implementar el programa principal que invoque a los incisos a,b y c 


pasaje es de tipo REGISTRO
	campos: codigo_vuelo, dia; dni_cliente; codigo_ciudad; monto_pasaje
	
a ) RETORNAR un ARBOL ordenado por codigo_ciudad 
		campos: codigo_ciudad y listaPasajes(codigo_vuelo, dni_cliente,monto_pasaje,dia)
	corte: dni = 0
	
b ) parametros: arbol, codigo1,codigo2, valor
	retornar: cant vuelos que realizo el cliente con dni = valor con codigo_vuelo entre codigo1 y codigo2 (no incluirlos)
	usar FUNCTION
	
c) parametros: arbol
	retornar: vector( de 1 a 31), vector acumulador 
		monto total acumulado en cada dia del mes} 
		
program TD2025;
type
	rangodias= 1..31;
	
	pasaje= record
		codigo_vuelo:integer;
		dia:rangodias;
		dni_cliente:integer;
		codigo_ciudad:integer;
		monto_pasaje:real;
	end;
	
	pasajes=Record
		codigo_vuelo:integer;
		dni_cliente:integer;
		monto_pasaje:real;
		dia:integer;
	end;
	
	lista=^nodolista;
		nodolista=record
			info:pasajes;
			sig:lista;
		end;
		
	ciudad=record
		codigo_ciudad:integer;
		pasajes:lista;
	end;
	
	arbol=^nodoarbol; //INCISO A
		nodoarbol=Record
			info:ciudad;
			hi:arbol;
			hd:Arbol;
		end;

	vector=Array[rangodias]of real; //INCISO C 

{pasaje es de tipo REGISTRO
	campos: codigo_vuelo, dia; dni_cliente; codigo_ciudad; monto_pasaje
	
a ) RETORNAR un ARBOL ordenado por codigo_ciudad 
		campos: codigo_ciudad y listaPasajes(codigo_vuelo, dni_cliente,monto_pasaje)
	corte: dni = 0}
	

procedure leerPasaje(var p:pasaje);
begin
	p.dni_cliente:= random(80);
	if (p.dni_cliente <>0)then begin
		p.codigo_vuelo:= random(70)+1;
		p.dia:= random(31)+1;
		p.codigo_ciudad:=random(90)+1;
		p.monto_pasaje:= random(90)+1;
	end;
end;
	
procedure agregarNodoLista(var l:lista; p:pasaje);
var	
	aux:lista;
begin
	new(aux);
	aux^.info.codigo_vuelo:= p.codigo_vuelo;
	aux^.info.dni_cliente:= p.dni_cliente;
	aux^.info.monto_pasaje:= p.monto_pasaje;
	aux^.info.dia:= p.dia;
	aux^.sig:= l;
	l:= aux;

end;

procedure agregarNodoArbol (var a:arbol; p:pasaje);
begin
	if (a = nil)then begin
		new(a);
		a^.info.codigo_ciudad:= p.codigo_ciudad;
		a^.info.pasajes:= nil;
		agregarNodoLista(a^.info.pasajes,p);
		a^.hi:= nil;
		a^.hd:= nil
	end
	else if (p.codigo_ciudad < a^.info.codigo_ciudad)then agregarNodoArbol(a^.hi,p)
		else if (p.codigo_ciudad > a^.info.codigo_ciudad)then agregarNodoArbol(a^.hd,p)
			else agregarNodoLista(a^.info.pasajes,p);
end;

procedure cargarEstructura(var a:Arbol);
var
	p:pasaje;
begin
	leerPasaje(p);
	while (p.dni_cliente <> 0)do begin
		agregarNodoArbol(a,p);
		leerPasaje(p);
	end;
end;
{b ) parametros: arbol, codigo1,codigo2, valor
	retornar: cant vuelos que realizo el cliente con dni = valor con codigo_vuelo entre codigo1 y codigo2 (no incluirlos)
	usar FUNCTION}
	
	
function entreValores( codigovuelo:integer; cod1,cod2:integer):boolean;
begin
	entreValores:= (codigovuelo >cod1)and (codigovuelo<cod2);
end;

function cantVuelos(a:Arbol;cod1,cod2:integer; valor:integer):integer;
var
	actual:lista;
begin
	if (a = nil)then 
		cantVuelos:= 0
		
		
	else begin
		cantVuelos:= cantVuelos(a^.hi,cod1,cod2,valor);
		
		actual:=  a^.info.pasajes;
		while (actual <> nil )do begin
			if (actual^.info.dni_cliente = valor) and entreValores(actual^.info.codigo_vuelo,cod1,cod2)then 
				cantVuelos:= cantVuelos+1;
			actual:= actual^.sig;
		end;
		
		cantVuelos:= cantVuelos+cantVuelos(a^.hd,cod1,cod2,valor);
	end;
	
end;

{c) parametros: arbol
	retornar: vector( de 1 a 31), vector acumulador 
		monto total acumulado en cada dia del mes }

procedure inicializarVector(var v:Vector);
var
	i:integer;
begin
	for i:= 1 to 31 do 
		v[i]:= 0;
end;
		
procedure cargarVector(a:arbol; var V:vector);
var
	actual:lista;
begin
	if (a<>nil)then begin
		cargarVector(a^.hi,v);
		
		actual:= a^.info.pasajes;
		while (actual <> nil)do begin
			v[actual^.info.dia]:= v[actual^.info.dia] +  1;
			actual:= actual^.sig;
		end;
		
		cargarVector(a^.hd,v);
	end;
end;

{---------------------------------------------------------------------}
		
procedure imprimirArbol(a:Arbol);
var
	actual:lista;
begin
	if (a<> nil)then begin
		imprimirArbol(a^.hi);
		
		writeln('Codigo de la ciudad: ',a^.info.codigo_ciudad);
		actual:= a^.info.pasajes;
		while(actual <> nil)do begin
			writeln('Codigo de Vuelo: ',actual^.info.codigo_vuelo);
			writeln('Dni del Cliente: ',actual^.info.dni_cliente);
			writeln('Monto del Pasaje: ',actual^.info.monto_pasaje:0:2);
			writeln('Dia: ',actual^.info.dia);
			writeln('---------------------');
			actual:= actual^.sig;
		end;
		writeln('-------------------------------------------------');
		
		
		imprimirArbol(a^.hd);
	end;
end;

procedure imprimirVector(v:Vector);
var
	i:integer;
begin
	for i:= 1 to 31 do begin
		writeln('El monto acumulado en el mes ',i,' es de: ',v[i]:0:2);
		writeln('---------------------------------------------');
	end;
end;

{---------------------------------------------------------------------}


var
	a:Arbol; valor,cod1,cod2:integer; v:Vector;
begin
	//INCISO A 
	randomize;
	a:= nil;
	cargarEstructura(a);
	imprimirArbol(a); //NO PIDE EL ENUNCIADO, SOLO PARA VERIFICAR 


	//INCISO B
	writeln('Ingrese un dni: '); readln(valor);
	writeln('Ingrese un codigo(principio del rango): '); readln(cod1);
	writeln('Ingrese un codigo(final del rango): '); readln(cod2);
	writeln('La cantidad de vuelos que realizo el cliente con dni: ',valor,' fue de ',cantVuelos(a,cod1,cod2,valor));
	
	//INCISO C 
	inicializarVector(v);
	cargarVector(a,v);
	imprimirVector(v); //NO PIDE EL ENUNCIADO, SOLO PARA VERIFICAR 

end.
