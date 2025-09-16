{Una biblioteca necesita un sistema para procesar la informacion de los 
libros. de cada libro se conoce: isbn, año de edicion, codigo del autor, 
y codigo de genero(1..15)

a) implementar un modulo que lea informacion de los libros y retorne una 
estructura de datos eficiente para la busqueda por codigo de autor que 
contenga codigo de autor y una lista de todos sus libros. la lectura 
finaliza al ingresar el valor 0 para un isbn.

b) realizar un modulo que reciba la estructura generada en el inciso a) y
un codigo. el modulo debe retornar una lista con codigo de autor y su
cantidad de libros. para cada autor con codigo superior al codigo ingresado.

c) realizar un modulo recursivo que reciba la estructura generada en el 
inciso b y retorne cantidad y codigo de autor con mayor cantidad de libros. }

{  REGISTRO DE LIBROS:
* 		isbn,anio_edicion, codigo_autor, codigo_genero(1..15)
* 
* inciso a:
* 	leo un libro 
* 	RETORNAR un ABB (ordenado por codigo de autor), el cual contiene:
* 		cod_autor
* 		listalibros 
* 	corte: ISBN = 0 
* 
* inciso b:
* 	recibo el ABB y un codigo por parametro
* 	RETORNAR lista con codigo de autor y su cantidad de libros
* 	condicion: para cada autor con codigo superior al codigo ingresado
* 
* 
* inciso c:
* 	modulo RECURSIVO que recibe por parametro: lista de inciso b.
* 	RETORNA cantidad y codigo de autor
* 		condicion: max cantidad de libros }

program TKparcial;
const
	maxgen=15;
type
	rangogenero=1..maxgen;
	libro1=record
		isbn:integer;
		anio_edicion:integer;
		codigo_autor:integer;
		codigo_genero:rangogenero;
	end;
	
	libro2=record
		isbn_libro:integer;
		anio_edicion_libro:integer;
		codigo_genero_libro:integer;
	end;
	
	lista1=^nodo1;
		nodo1=record
			info1:libro2;
			sig:lista1;
		end;
		
	autor=record
		cod_autor:integer;
		libros:lista1;
	end;
	
	arbol=^nodo2; //INCISO A 
		nodo2=record
			info2:autor;
			hi:arbol;
			hd:arbol;
		end;
		
	data=record
		autor_code:integer;
		cant_libros:integer;
	end;
	
	lista2=^nodo3; //INCISO B 
		nodo3=Record
			info3:data;
			sig:lista2;
		end;
		


{----------------------------------------------------------------------}
procedure leerLibro( var l:libro1);
begin
	l.isbn:= random(90);
	if (l.isbn <> 0)then begin
		l.anio_edicion:= random(40);
		l.codigo_autor:= random(30);
		l.codigo_genero:= random(15)+1;
	end;
end;
	
procedure agregarLista(var l:lista1; r:libro1);
var
	nue:lista1;
begin
	new(nue);
	nue^.info1.isbn_libro := r.isbn;
	nue^.info1.anio_edicion_libro := r.anio_edicion;
	nue^.info1.codigo_genero_libro := r.codigo_genero;
	nue^.sig := l;
	l := nue;
end;


procedure cargarNodo(var a:arbol; r:libro1);
begin
	if (a = nil)then begin
		new (a);
		a^.info2.cod_autor:= r.codigo_autor;
		a^.info2.libros:= nil;
		agregarLista(a^.info2.libros,r);
		a^.hi:= nil;
		a^.hd:= nil
	end
	else if (r.codigo_autor < a^.info2.cod_autor)then cargarNodo(a^.hi,r)
		else if (r.codigo_autor >a^.info2.cod_autor)then cargarNodo(a^.hd,r)
			else agregarLista(a^.info2.libros,r);
end;

procedure cargarLibros(var a:Arbol); // INCISO A 
var
	l:libro1;
begin
	leerLibro(l);
	while (l.isbn <>0)do begin
		cargarNodo(a,l);
		leerLibro(l);
	end;
end;		

{---------------------------------------------------------------------}


function contarlibros( l:lista1):integer;
var
	cant:integer;
begin
	cant:= 0;
	while (l<> nil)do begin
		cant:= cant + 1;
		l:= l^.sig;
	end;
	contarlibros:= cant;
end;


procedure agregarLista2(var l: lista2; cod, cant: integer);
var
  nuevo: lista2;
begin
  new(nuevo);
  nuevo^.info3.autor_code := cod;
  nuevo^.info3.cant_libros := cant;
  nuevo^.sig := l;
  l := nuevo;
end;

procedure cargarLista(a: arbol; codigo: integer; var l: lista2); //INCISO B 
begin
  if (a <> nil) then begin
    if (a^.info2.cod_autor > codigo) then begin
      agregarLista2(l, a^.info2.cod_autor, contarlibros(a^.info2.libros));
      cargarLista(a^.hi, codigo, l);
      cargarLista(a^.hd, codigo, l);
    end
    else
      cargarLista(a^.hd, codigo, l);  // sigo buscando a la derecha
  end;
end;

{----------------------------------------------------------------------}

procedure calcular( l:lista2; var cant,codigoautor,max:integer); // INCISO C 
begin
	if (l <> nil)then begin
		if (l^.info3.cant_libros > max)then begin 
			max:= l^.info3.cant_libros;
			codigoautor:= l^.info3.autor_code;
		end;
		calcular(l^.sig, cant,codigoautor,max);
	end;
end;

{---------------------------------------------------------------------}
var
	a:Arbol;l:lista2; codigo,codigoautor,max,cant:integer;
begin

	//INCISO A 
	randomize;
	a:= nil;
	cargarLibros(a);
	
	//INCISO B 
	l:= nil; 
	writeln('Ingrese un codigo: '); readln(codigo);
	cargarLista(a,codigo,l);
	
	//INCISO C 
	cant:= 0;
	max:= -999;
	calcular(l,cant,codigoautor,max);
end.
