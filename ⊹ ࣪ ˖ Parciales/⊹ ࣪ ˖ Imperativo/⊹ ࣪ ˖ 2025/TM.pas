{una clinica odontologica necesita un sistema para el procesamiento de
las atenciones realizadas a los pacientes en julio de 2025.

a) implementar un modulo que lea informacion de las atenciones. de cada
atenciones se lee: matricula de odontologo, dni del paciente, dia y 
diagnostico(valor entre 1 y 10). la lectura finaliza con el dni 0. se 
sugiere utilizar el modulo leerAtencion(). el modulo debe retornar un 
arbol binario de busqueda ordenado por matricula del odontologo. para cada
matricula de odontologo deben almacenarse las atenciones realizadas.

b) implementar un modulo que reciba el arbol generado en a), dos matriculas
y un valor entero. el modulo debe retornar la cantidad total de atenciones
realizadas al paciente con dni igual al valor ingresado por odontologos
con matriculas entre las dos matriculas ingresadas(sin incluir)

c) realizar un modulo que reciba el arbol generado en a) y retorne, para 
cada diagnostico, la cantidad de atenciones realizadas

nota: implementar el programa principal, que invoque a los incisos a, b 
y c.}


{a ) atencion es un REGISTRO
	con campos: matricula_odontologo, dni_pac,dia y diagnostico(1..10)
	corte: dni= 0

retornar: un ARBOL ordenado por matricula_odontologo
		campos del arbol: matricula y listaAtenciones:
				campos de la listaAtenciones: dni_pac, dia y diagnostico }

{b ) parametros: arbol, matricula1,matricula2, valor
	retornar: cantidad de atenciones realizadas al paciente con dni=valor 
			  con matriculas entre matricula1 y matricula2(sin incluir estos);
			
	usar un function }
	
{c) parametros: arbol y vector
	retornar: vector cargado
	cantidad de atenciones realizadas por diagnostico
	inicializar el vector previamente como contador
	usar un procedimiento }
	
	

program TM2025;
type
	rangodiagnostico=1..10;
	
	atencion=record
		matricula_odontologo:integer;
		dni_pac:integer;
		dia:integer;
		diagnostico:rangodiagnostico;
	end;
	
	atenciones=record
		dni_pac:integer;
		dia:integer;
		diagnostico:rangodiagnostico;
	end;
	
	lista=^nodolista;
		nodolista=record
			info:atenciones;
			sig:lista;
		end;
		
	matricula=record
		odo_matricula:integer;
		atenciones:lista;
	end;
	
	arbol=^nodoarbol; //INCISO A 
		nodoarbol=Record
			info:matricula;
			hi:arbol;
			hd:arbol;
		end;
	
	vector=array[rangodiagnostico]of integer; //INCISO B 


{a ) atencion es un REGISTRO
	con campos: matricula_odontologo, dni_pac,dia y diagnostico(1..10)
	corte: dni= 0

retornar: un ARBOL ordenado por matricula_odontologo
		campos del arbol: matricula y listaAtenciones:
				campos de la listaAtenciones: dni_pac, dia y diagnostico }

procedure leerAtencion(var p:atencion);
begin
	p.dni_pac:= random(70);
	if (p.dni_pac <> 0)then begin 
		p.matricula_odontologo:= random(50)+1;
		p.dia:= random(31)+1;
		p.diagnostico:= random(10)+1;
	end;
end;
	
procedure agregarAdelante(var l:lista; p:atencion);
var	aux:lista;
begin
	new(aux);
	aux^.info.dni_pac:= p.dni_pac;
	aux^.info.dia:= p.dia;
	aux^.info.diagnostico:= p.diagnostico; 
	aux^.sig:= l;
	l:= aux; 
end;

procedure agregarNodoArbol(var a:Arbol; p:atencion);
begin
	if (a = nil)then begin
		new(a);
		a^.info.odo_matricula:= p.matricula_odontologo;
		a^.info.atenciones:= nil;
		agregarAdelante(a^.info.atenciones,p);
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else if (p.matricula_odontologo < a^.info.odo_matricula)then agregarNodoArbol(a^.hi,p)
		else if (p.matricula_odontologo > a^.info.odo_matricula)then agregarNodoArbol(a^.hd,p)
			else agregarAdelante(a^.info.atenciones,p);
end;

procedure cargarEstructura(var a:arbol);
var
	p:atencion; 
begin
	leerAtencion(p);
	while (p.dni_pac <>0)do begin
		agregarNodoArbol(a,p);
		leerAtencion(p);
	end;
end;
{b ) parametros: arbol, matricula1,matricula2, valor
	retornar: cantidad de atenciones realizadas al paciente con dni=valor 
			  con matriculas entre matricula1 y matricula2(sin incluir estos);
			
	usar un function 
	debo tener tres casos a tener en cuenta
	* el arbol esta vacio(caso base)
	* esta en ese nodo
	* no esta y recorro hi o hd}
	
		
		
function estaenelRango(odomatri:integer; matricula1,matricula2:integer):boolean;
begin
	estaenelRango:= (odomatri > matricula1) and (odomatri < matricula2);
end;


function cantatenciones(a:arbol; matricula1,matricula2:integer; valor:integer):integer;
var
  total:integer;
  actual:lista;
begin
  if (a = nil) then
    cantatenciones := 0
  else begin
    total := 0;

    if (estaenelRango(a^.info.odo_matricula, matricula1, matricula2)) then begin
      actual := a^.info.atenciones;
      while (actual <> nil) do begin
        if (actual^.info.dni_pac = valor) then
          total := total + 1;
        actual := actual^.sig;
      end;
    end;

    if (a^.info.odo_matricula > matricula1) then
      total := total + cantatenciones(a^.hi, matricula1, matricula2, valor);

    if (a^.info.odo_matricula < matricula2) then
      total := total + cantatenciones(a^.hd, matricula1, matricula2, valor);

    cantatenciones := total;
  end;
end;

	
{c) parametros: arbol y vector
	retornar: vector cargado
	cantidad de atenciones realizadas por diagnostico
	inicializar el vector previamente como contador
	usar un procedimiento }
	
procedure inicializarvector(var v:vector);
var i:integer;
begin
	for i := 1 to 10 do 
		v[i]:= 0;
end;
		
	
procedure cargarVector(a:arbol; var v:Vector);
var
	actual:lista;
begin
	if (a<> nil)then begin
		cargarVector(a^.hi,v);
		actual:= a^.info.atenciones;
		while (actual <> nil)do begin
			v[actual^.info.diagnostico]:= v[actual^.info.diagnostico] + 1;
			actual:= actual^.sig;
		end;
		cargarVector(a^.hd,v);
	end;
end;


{--------------------------------------------------------------------}
	
procedure imprimirArbol(a:Arbol);
var
	act:lista;
begin
	if (a <> nil)then begin
		imprimirArbol(a^.hi);
		writeln('matricula del odontologo: ',a^.info.odo_matricula);
		act:= a^.info.atenciones;
		while (act <> nil)do begin
			writeln('dni del paciente:',act^.info.dni_pac);
			writeln('dia: ',act^.info.dia);
			writeln('diagnostico: ',act^.info.diagnostico);
			writeln('----------------------');
			act:= act^.sig;
		end;
		writeln('---------------------------------');
		imprimirArbol(a^.hd);
	end;
end;

procedure imprimirvector(v:Vector);
var
	i:integer;
begin
	for i:= 1 to 10 do 
		writeln(v[i]);
end;

{--------------------------------------------------------------------}
var
	a:arbol; valor:integer;
	matricula1,matricula2:integer;
	v:vector;
begin	
	//INCISO A
	randomize;
	a:= nil;
	cargarEstructura(a);
	imprimirArbol(a); //USADO SOLO PARA VERIFICAR, NO LO PIDE EL ENUNCIADO
	
	//INCISO B
	writeln('Ingrese un valor: ');readln(valor);
	writeln('Ingrese la primera matricula: ');readln(matricula1);
	writeln('Ingrese la segunda matricula: ');readln(matricula2);
	writeln('La cantidad de atenciones realizadas al paciente con dni ',valor,' entre las matriculas ',matricula1,' y ',matricula2,' fue de:', cantatenciones(a,matricula1,matricula2,valor));
	
	//INCISO C 
	inicializarvector(v);
	cargarvector(a,v);
	imprimirvector(v);//USADO SOLO PARA VERIFICAR, NO LO PIDE EL ENUNCIADO
end.
