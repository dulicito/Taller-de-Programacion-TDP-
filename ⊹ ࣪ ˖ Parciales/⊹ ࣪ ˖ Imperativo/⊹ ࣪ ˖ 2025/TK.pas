{una biblioteca necesita un sistema para procesar la informacion de
los libros. de cada libro se conoce: isbn, año de edicion, codigo de
autor y codigo de genero (1..15)

a) implementar un modulo que lea informacion de los libros y retorne 
una estructura de datos eficiente para la busqueda por codigo de autor 
que contenga codigo de autor y una lista de todos sus libros. la lectura 
finaliza al ingresar el valor 0 para un isbn.

b) realizar un modulo que reciba la estructura generada en el inciso a) 
y un codigo. el modulo debe retornar una lista con codigo de autor y su 
cantidad de libros. para cada autor con codigo superior al codigo ingresado

c) realizar un modulo recursivo que reciba la estructura generada en el
inciso b) y retorne cantidad y codigo de autor con mayor cantidad de
libros.}

{ libro es de tipo REGISTRO:
 	sus campos son: isbn, año edicion, codigo autor y codigo genero(1..15)

  a ) generar un ARBOL, ordenado por codigo de autor
		cada nodo contiene: codigo autor, una lista con todos sus libros
	  corte de control: isbn = 0
	 
   b ) procedimiento con parametros: arbol y codigo
    	debe retornar: una lista que contiene codigo autor y su cantidad de libros
	   condicion: autores con codigo superior al ingresado por teclado
	
   c ) procedimiento RECURSIVO con parametros: lista(inciso b), cantidad y codigoautor
    	debe retornar: cantidad y codigo autor
    	condicion: el autor con el max cantidad de libros de la lista}
    	
program tk2025;
const
	maxgeneros=15;
type
	rangogeneros= 1..maxgeneros;
	libro=record
		isbn:integer;
		anio_edicion:integer;
		codigo_Autor:integer;
		codigo_genero:rangogeneros;
	end;
	
	libroautor=record
		isbn:integer;
		anio_edicion:integer;
		cod_genero:rangogeneros;
	end;
	
	lista=^nodoLista;
		nodoLista=record
			info:libroautor;
			sig:lista;
		end;
	
	autor=record
		cod_autor:integer;
		libros:lista;
	end;
	
	arbol=^nodoArbol; //INCISO A 
		nodoArbol=record
			info:autor;
			hi:arbol;
			hd:arbol;
		end;
		
	autorB=record
		cod_au:integer;
		cantlibros:integer;
	end;
	
	listaB= ^nodoB; //INCISO B 
		nodoB=record
			infoB: autorB;
			sig:listaB;
		end;

{ a ) generar un ARBOL, ordenado por codigo de autor
		cada nodo contiene: codigo autor, una lista con todos sus libros
	  corte de control: isbn = 0}
	 

procedure leerLibro(var o:libro);
begin
	o.isbn:= random(70);
	if (o.isbn <>0)then begin
		o.anio_edicion:= random(100);
		o.codigo_autor:= random(50);
		o.codigo_genero:= random(15)+1;
	end;
end;
	
		
procedure carglista (var l:lista; o:libro);
var
	aux:lista;
begin
	new(aux);
	aux^.info.isbn:= o.isbn;
	aux^.info.anio_edicion:= o.anio_edicion;
	aux^.info.cod_genero:= o.codigo_genero;
	aux^.sig:= l;
	l:= aux;
end;


procedure agregarnodoArbol(var a:arbol; o:libro);
begin
	if (a = nil)then begin
		new(a);
		a^.info.cod_autor:= o.codigo_autor;
		a^.info.libros:= nil;
		carglista(a^.info.libros,o);
		a^.hi:= nil;
		a^.hd:= nil
	end
	else if (o.codigo_autor < a^.info.cod_autor)then agregarnodoArbol(a^.hi,o)
		else if (o.codigo_autor > a^.info.cod_autor)then agregarnodoArbol(a^.hd,o)
			else cargLista(a^.info.libros,o);
end;


procedure cargarArbol(var a:arbol);
var
	o:libro;
begin
	leerLibro(o);
	while (o.isbn <> 0)do begin
		agregarnodoArbol(a,o);
		leerLibro(o);
	end;
end;

   {b ) procedimiento con parametros: arbol, codigo,listab
    	debe retornar: una lista que contiene codigo autor y su cantidad de libros
	   condicion: autores con codigo superior al ingresado por teclado}

		
function cantLista( l:lista):integer;
var
	cant:integer;
begin
	cant:= 0;
	while (l <> nil)do begin
		cant:= cant +1;
		l:= l^.sig;
	end;
	cantLista:=cant;
end;

procedure agregarnodo(var l:listaB; codigoautor:integer; cant:integer);
var
	aux:listaB;
begin
	new(aux);
	aux^.infoB.cod_au:= codigoautor;
	aux^.infoB.cantlibros:= cant;
	aux^.sig:= l;
	l:= aux;
end;

procedure generarListaAutoresMayores(a: arbol; codigo:integer; var l:listaB);
var
	cant:integer;
begin
	if (a <> nil )then begin
		if (a^.info.cod_autor > codigo)then begin
			cant:= cantLista(a^.info.libros);
			agregarNodo(l,a^.info.cod_autor,cant);
			generarListaAutoresMayores(a^.hi,codigo,l);
			generarListaAutoresMayores(a^.hd,codigo,l);
		end 
		else generarListaAutoresMayores(a^.hd,codigo,l);
	end;
end;

   {c ) procedimiento RECURSIVO con parametros: lista(inciso b), cantidad y codigoautor
    	debe retornar: cantidad y codigo autor
    	condicion: el autor con el max cantidad de libros de la lista}
  
procedure buscarMax(l:listaB; var maxcant,maxautor:integer);
begin
	if (l <> nil)then begin
		if (l^.infoB.cantlibros > maxcant)then begin
			maxcant:= l^.infoB.cantlibros;
			maxautor:= l^.infoB.cod_au;
		end;
		buscarMax(l^.sig,maxcant,maxautor);
	end;
end;


{---------------------------------------------------------------------}		
procedure imprimirArbol(a:arbol);
begin
	if (a<> nil)then begin
		imprimirArbol(a^.hi);
		writeln(a^.info.cod_autor);
		writeln(a^.info.libros^.info.isbn);
		writeln(a^.info.libros^.info.anio_edicion);
		writeln(a^.info.libros^.info.cod_genero);
		writeln('-------------------------------');
		imprimirArbol(a^.hd);
	end;
end;


var
	a:arbol; codigo,maxautor,maxcant:integer; l: listaB;
begin
//INCISO A 
	randomize;
	a:= nil;
	cargarArbol(a);
	imprimirArbol(a); //PARA SOLO VERIFICAR ! 
	
//INCISO B 
	writeln('Ingrese un codigo por teclado: ');readln(codigo);
	l:= nil;
	generarListaAutoresMayores(a,codigo,l);

//INCISO C 
	maxcant:= -999;
	buscarMax(l,maxcant, maxautor);
	writeln('El autor con mayor cantidad de libros de la lista fue: ',maxautor,' con: ',maxcant); //NO LO PIDE EL ENUNCIADO PERO PARA VERIFICAR
end.
