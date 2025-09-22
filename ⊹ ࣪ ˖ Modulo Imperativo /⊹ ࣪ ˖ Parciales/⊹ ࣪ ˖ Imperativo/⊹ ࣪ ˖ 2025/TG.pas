{una biblioteca necesita un sistema para procesar la informacion de los 
libros. de cada libro se conoce: isbn,codigo del autor y codigo de 
genero(1..15)

a) implementar un modulo que lea informacion de los libros y retorne 
una estructura de datos eficiente para la busqueda por codigo de autor
que contenga codigo de autor y una lista de todos sus libros. la lectura 
finaliza al ingresar el valor 0 para un isbn.

b) realizar un modulo que reciba la estructura generada en el inciso a),
un codigo de autor y un codigo de genero. el modulo debe retornar una 
lista con codigo de autor y cantidad de libros del codigo de genero 
recibido, para cada autor cuyo codigo sea superior al codigo de autor
ingresado.

c) realizar un modulo recursivo que reciba la estructura generada en el
inciso b) y retorne cantidad y codigo de autor con mayor cantidad de libros }


{libro es de tipo REGISTRO
	campos: isbn, cod_autor y cod_genero(rangogeneros(1..15))
	
a ) procedimiento
	retornar: ARBOL ordenado por cod_autor 
		campos del arbol: codigoautor y listaLibros
			campos de libros: isbn y codigogenero
	lee libros 
	carga el arbol
	corte: isbn = 0}

{b ) procedimiento con parametros: arbol, codigo autor y codigo genero 
	debe retornar: otra lista (listaAutorCod) que contiene dentro:
						codigoautor y cantlibros
	condicion para agregar a la lista:
			codigo superior al codigo autor del parametro recibido }
			
{c ) procedimiento RECURSVIVO 
	parametros: listaAutorCod, cantmax, max autor y max?
	retornar: cantidad maxima y autor con mayor cantidad de libros }
	
program TG2025;
type
	rangogeneros=1..15;
	libro=record
		isbn:integer;
		cod_autor:integer;
		cod_genero:rangogeneros;
	end;
	
	infolibro=record
		isbn:integer;
		codigogenero:rangogeneros;
	end;
	
	listalibros=^nodolibros;
		nodolibros=Record
			info:infolibro;
			sig:listalibros;
		end;
		
	autor=Record
		codigoautor:integer;
		libros:listalibros;
	end;
	
	arbol=^nodoarbol; //INCISO A 
		nodoarbol=Record
			info:autor;
			hi:arbol;
			hd:arbol;
		end;
		
	autorcod=record
		codigoautor:integer;
		cantlibros:integer;
	end;
	
	listaAutorCod=^nodocod; //INCISO B 
		nodocod=record
			info:autorcod;
			sig:listaAutorCod;
		end;


{libro es de tipo REGISTRO
	campos: isbn, cod_autor y cod_genero(rangogeneros(1..15))
	
a ) procedimiento
	retornar: ARBOL ordenado por cod_autor 
		campos del arbol: codigoautor y listaLibros
			campos de libros: isbn y codigogenero
	lee libros 
	carga el arbol
	corte: isbn = 0}
	

procedure leerLibro(var p:libro);
begin
	p.isbn:= random(80);
	if (p.isbn <> 0)then begin
		p.cod_autor:= random(70)+1;
		p.cod_genero:= random(15)+1;
	end;
end;

	
procedure agregarNodoLista(var l:listalibros; p:libro);
var
	aux:listalibros;
begin
	new(aux);
	aux^.info.isbn:= p.isbn;
	aux^.info.codigogenero:= p.cod_genero; 
	aux^.sig:= l;
	l:= aux;
end;


procedure agregarNodoArbol(var a:arbol; p:libro);
begin
	if (a=nil)then begin
		new(a);
		a^.info.codigoautor:= p.cod_autor;
		a^.info.libros:= nil;
		agregarNodoLista(a^.info.libros,p);
		a^.hi:= nil;
		a^.hd:= nil
	end
	else if (p.cod_autor < a^.info.codigoautor)then agregarNodoArbol(a^.hi,p)
		else if (p.cod_autor > a^.info.codigoautor)then agregarNodoArbol(a^.hd,p)
			else agregarNodoLista(a^.info.libros,p);
end;


procedure crearEstructura (var a: arbol);
var
	p:libro;
begin
	leerLibro(p);
	while (p.isbn <> 0)do begin
		agregarNodoArbol(a,p);
		leerLibro(p);
	end;
end;

{b ) procedimiento con parametros: arbol, codigo autor y codigo genero 
	debe retornar: otra lista (listaAutorCod) que contiene dentro:
						codigoautor y cantlibros
	condicion para agregar a la lista:
			codigo superior al codigo autor del parametro recibido }
			

		
procedure recorrerlibros( l:listalibros; var cant:integer; genero:integer);
begin
	while (l<>nil)do begin
		if (l^.info.codigogenero = genero)then
			cant:= cant +1;
		l:= l^.sig;
	end;
end;



procedure agregarLista( var l:listaAutorCod; cod:integer; cant:integer);
var
	aux:listaAutorCod;
begin
	new(aux);
	aux^.info.codigoautor:= cod;
	aux^.info.cantlibros:= cant;
	aux^.sig:= l;
	l:= aux;
end;

procedure crearLista(a:Arbol ;var l:listaAutorCod;codigoautor:integer; codigogenero:integer);
var
	cant: integer;
begin
	if (a= nil)then 
		l:= nil
	else 
		if (a^.info.codigoautor> codigoautor)then begin
			cant:= 0;
			recorrerlibros(a^.info.libros,cant,codigogenero);
			agregarLista(l,a^.info.codigoautor,cant);
		end
		else if (codigoautor < a^.info.codigoautor)then crearLista(a^.hi,l,codigoautor,codigogenero)
			else if (codigoautor> a^.info.codigoautor)then crearLista(a^.hd,l,codigoautor,codigogenero)
end;


{c ) procedimiento RECURSVIVO 
	parametros: listaAutorCod, cantmax, max autor y max?
	retornar: cantidad maxima y autor con mayor cantidad de libros }


procedure maximos(l:listaAutorCod; var cantmax:integer; var maxautor:integer);
begin
	if (l <> nil)then begin
		if (l^.info.cantlibros > cantmax)then begin
			cantmax:= l^.info.cantlibros;
			maxautor:= l^.info.codigoautor;
		end;
		maximos(l^.sig,cantmax,maxautor);
	end;
end;

{---------------------------------------------------------------------}
		
procedure imprimirArbol(a:Arbol);
begin
	if (a <> nil)then begin
		imprimirArbol(a^.hi);
		writeln('codigo del autor: ',a^.info.codigoautor);
		writeln('isbn: ',a^.info.libros^.info.isbn);
		writeln('codigo del genero: ',a^.info.libros^.info.codigogenero);
		writeln('--------------------------------------------');
		imprimirArbol(a^.hd);
	end;
end;


var
	a:arbol; l:listaAutorCod; codigoautor,codigogenero:integer; cantmax:integer; maxautor:integer;
begin
	//INCISO A 
	randomize;
	a:= nil;
	crearEstructura(a); 
	imprimirArbol(a); //OPCIONAL PARA VER 
	
	//INCISO B 
	l:= nil;
	writeln('Ingrese un codigo de autor: '); readln(codigoautor);
	writeln('ingrese un codigo de genero(de 1 a 15): '); readln(codigogenero);
	crearLista(a,l,codigoautor,codigogenero);
	
	//INCISO C 
	cantmax:= -999;
	maximos(l,cantmax,maxautor);
	writeln('el autor con mayor cantidad de libros fue: ',maxautor); //PARA VERIFICAR, NO PIDE EL ENUNCIADO, SOLO PIDE RETORNAR EL EJERCICIO 
end.
