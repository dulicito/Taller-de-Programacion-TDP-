{Un sistema de gestion de correos electronicos desea manejar
los correos recibidos por cada cliente. de cada cliente conoce
su codigo (1..1000), direccion de email y todos los mensajes
de correo que ha recibido. de cada mensaje conoce la direccion 
del emisor, la fecha del envio, el asunto, el texto y ya ya fue
leido.

realizar un programa que invoque a modulos para:

a ) leer y almacenar los correos electronicos en una estructura 
de datos eficiente para la busqueda por codigo de cliente. la 
lectura finaliza al ingresar el cliente 0. de cada correo se lee
el id del cliente, su direccion de correo y toda la informacion
del mensaje. la informacion debe quedar agrupada por cliente.

b ) leer un codigo de cliente e informar la cantidad de correos 
sin leer.

c ) leer una direccion de correo e informar la cantidad de 
correos enviados desde dicha direccion.}

program ejemplo2;
const
	maxcod = 1000;
type
	rango_cod = 1..maxcod;

	mensaje = record
		emisor: string;
		texto: string;
		asunto: string;
		fecha: string;
		leido: boolean;
	end;

	cliente = record
		cod: rango_cod;
		email: string;
	end;

	mensajeleido = record
		msj: mensaje;
		cli: cliente;
	end;

	lista = ^nodoLista;
	nodoLista = record
		dato: mensaje;
		sig: lista;
	end;

	datocliente = record
		cli: cliente;
		mensajes: lista;
	end;

	arbol = ^nodoArbol;
	nodoArbol = record
		dato: datocliente;
		hd: arbol;
		hi: arbol;
	end;

{---------------- PROCEDIMIENTOS ----------------}

procedure agregaradelante(var l: lista; m: mensaje);
var aux: lista;
begin
	new(aux);
	aux^.dato := m;
	aux^.sig := l;
	l := aux;
end;

procedure leermensaje(var m: mensajeleido);
var i: integer;
begin
	readln(m.cli.cod);
	if m.cli.cod = 0 then exit;
	readln(m.cli.email);
	readln(m.msj.emisor);
	readln(m.msj.fecha);
	readln(m.msj.asunto);
	readln(m.msj.texto);
	writeln('Ingrese 1 si el mensaje fue leido, otro valor si no:');
	readln(i);
	m.msj.leido := (i = 1);
end;

procedure agregar(var a: arbol; m: mensajeleido);
begin
	if a = nil then begin
		new(a);
		a^.dato.cli := m.cli;
		a^.dato.mensajes := nil;
		agregaradelante(a^.dato.mensajes, m.msj);
		a^.hi := nil;
		a^.hd := nil;
	end
	else if a^.dato.cli.cod = m.cli.cod then
		agregaradelante(a^.dato.mensajes, m.msj)
	else if m.cli.cod < a^.dato.cli.cod then
		agregar(a^.hi, m)
	else
		agregar(a^.hd, m);
end;

function contarsinleer(l: lista): integer;
begin
	if l = nil then
		contarsinleer := 0
	else if not l^.dato.leido then
		contarsinleer := 1 + contarsinleer(l^.sig)
	else
		contarsinleer := contarsinleer(l^.sig);
end;

function cantidadDeCorreosSinLeer(cod: rango_cod; a: arbol): integer;
begin
	if a = nil then
		cantidadDeCorreosSinLeer := 0
	else if a^.dato.cli.cod = cod then
		cantidadDeCorreosSinLeer := contarsinleer(a^.dato.mensajes)
	else if cod < a^.dato.cli.cod then
		cantidadDeCorreosSinLeer := cantidadDeCorreosSinLeer(cod, a^.hi)
	else
		cantidadDeCorreosSinLeer := cantidadDeCorreosSinLeer(cod, a^.hd);
end;

function contarsindesdir(l: lista; dir: string): integer;
begin
	if l = nil then
		contarsindesdir := 0
	else if l^.dato.emisor = dir then
		contarsindesdir := 1 + contarsindesdir(l^.sig, dir)
	else
		contarsindesdir := contarsindesdir(l^.sig, dir);
end;

function contarcorreodesdedireccion(a: arbol; dir: string): integer;
var
	clienteactual, subarbolizq, subarbolder: integer;
begin
	if a = nil then
		contarcorreodesdedireccion := 0
	else begin
		clienteactual := contarsindesdir(a^.dato.mensajes, dir);
		subarbolizq := contarcorreodesdedireccion(a^.hi, dir);
		subarbolder := contarcorreodesdedireccion(a^.hd, dir);
		contarcorreodesdedireccion := clienteactual + subarbolizq + subarbolder;
	end;
end;

{---------------- PROGRAMA PRINCIPAL ----------------}

var
	a: arbol;
	m: mensajeleido;
	cod: rango_cod;
	dir: string;

begin
	a := nil;

	leermensaje(m);
	while m.cli.cod <> 0 do
	begin
		agregar(a, m);
		leermensaje(m);
	end;

	writeln('Ingrese codigo de cliente para ver cantidad de correos sin leer:');
	readln(cod);
	writeln('Cantidad de correos sin leer: ', cantidadDeCorreosSinLeer(cod, a));

	writeln('Ingrese direccion de correo para contar mensajes enviados:');
	readln(dir);
	writeln('Cantidad de correos desde esa direccion: ', contarcorreodesdedireccion(a, dir));
end.
