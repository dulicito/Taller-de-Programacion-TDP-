{Un sistema de gestion de correos electronicos desea manejar los
correos recibidos por cada cliente.De cada cliente conoce su 
codigo(1..1000), direccion de email y la cantidad de correos sin 
leer.

realizar un programa que invoque a modulos para:
a) leer y almacenar los clientes en una estructura de datos EFICIENTE
PARA LA BUSQUEDA POR CODIGO DE CLIENTE. la lectura finaliza al 
ingresar el cliente 1000.

b) leer un codigo de cliente e informar la cantidad de correos sin 
leer.

c) Imprimir todos los codigos de cliente de mayor a menor.

d) Leer una direccion de correo e informar si existe un cliente con esa
direccion} 

{Anotaciones:
* cuando nos referimos a una estructura de datos eficiente para la 
busqueda de tal cosa, nos referimos a un ABB.}

program ejemplo1;
const
	maxCod = 1000;
type
	rango_cod = 1..maxCod;
	cliente=Record
		cod:integer;
		email: string;
		sin_leer:integer;
	end;
	
	arbol = ^nodo;
		nodo=record
			dato:cliente;
			hd: arbol;
			hi:arbol;
		end;

{---------------------------------------------------------------}

procedure leerCliente (var c: cliente);
begin
	writeln('Ingrese el codigo entre 1 y 1000: '); 
	readln(c.cod);
	writeln('Ingrese el email: '); 
	readln(c.email);
	writeln('ingrese la cantidad de mensajes sin leer: '); 
	readln(c.sin_leer);
end;

procedure agregar (var a:arbol; c:cliente);
var
	aux:arbol;
begin
	if (a = nil)then begin
		new(aux);
		aux^.hi:= nil;
		aux^.hd:= nil;
		a:= aux;
	end
	else begin
		if (a^.dato.cod > c.cod)then 
			agregar(a^.hi,c)
		else agregar (a^.hd, c);
	end;
end;

procedure almacenarClientes(var a: arbol);//INCISO A
var
	c:cliente;
begin
	repeat
		leerCliente(c);
		agregar(a,c);
	until(c.cod = 1000);
end;

{---------------------------------------------------------------}


function cantidadDeCorreosSinLeer(cod:rango_cod; a:arbol):integer; //INCISO B 
begin
	if (a = nil)then 
		cantidadDeCorreosSinLeer:= -1
	else begin
		if (a^.dato.cod = cod)then
			cantidadDeCorreosSinLeer:= a^.dato.sin_leer
		else if (a^.dato.cod > cod)then 
			cantidadDeCorreosSinLeer:= cantidadDeCorreosSinLeer(cod,a^.hi)
		else 
			cantidadDeCorreosSinLeer:= cantidadDeCorreosSinLeer(cod,a^.hd);
	end;
end;

{---------------------------------------------------------------}

procedure imprimirDeMayorAMenor( a:arbol);//INCISO C 
begin
	if (a <> nil)then begin
		imprimirDeMayorAMenor(a^.hd);
		writeln(a^.dato.cod);
		imprimirDeMayorAMenor(a^.hi);
	end;
end;
{---------------------------------------------------------------}

function existeEmail( a:arbol; email:string):boolean; //INCISO D 
var
	existe:boolean;
begin
	if (a = nil)then
		existeEmail:= false
	else
		if (a^.dato.email = email)then 
			existeEmail:= true
		else begin
			existe:= existeEmail(a^.hi,email);
			if (not existe)then
				existe:= existeEmail(a^.hd,email);
			existeEmail:= existe;
		end;
end;

{---------------------------------------------------------------}

var
	a:arbol;
	cod: rango_cod;
	email:string;
begin
	almacenarClientes(a); //INCISO A 
	writeln('Ingrese un codigo de cliente: '); readln(cod);
	writeln(cantidadDeCorreosSinLeer(cod,a)); //INCISO B 
	imprimirDeMayorAMenor(a); //INCISO C 
	writeln('Ingrese un email: '); readln(email);
	if (existeEmail(a,email))then //INCISO D
		writeln('Existe!') else writeln('No existe');
end.

