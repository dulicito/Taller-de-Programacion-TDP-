{el correo argentino necesita procesar los envios entregados
durante el mes de julio de 2024. de cada envio se conoce el 
codigo del cliente, dia, codigo postal y peso del paquete.

a) implementar un modulo que lea envios, genere y retorne un 
arbol binario de busqueda ordenado por codigo postal, donde 
para cada codigo postal se almacenen en una lista todos los 
envios(codigo de cliente, dia y peso del paquete) correspondientes.
la lectura finaliza con codigo del cliente 0. se sugiere 
utilizar el modulo leerEnvio()

b) implementar un modulo que reciba la estructura generada
en a) y un codigo postal y retorne todos los envios de 
dicho codigo postal.

c) realizar un modulo recursivo que reciba la estructura que 
retorna el inciso b) y retorne los dos codigos de cliente
correspondientes al envio con mayor y menor peso.

NOTA: implementar el programa principal que invoque los
incisos a, b y c. }

program TCparcial;
const
	maxdias= 31;
type
	rango_dias= 1..maxdias; 
	envio1=record
		codigo_cliente:integer;
		dia:rango_dias;
		codigo_postal:integer;
		peso_paquete:integer;
	end;
			
	envio2=record
		cod_cli:integer;
		dia2:rango_dias;
		peso:integer;
	end; 
	
	lista= ^nodo1;
		nodo1=Record
			info1:envio2;
			sig:lista;
		end;
		
	postal=Record
		cod_postal:integer;
		info2:lista;
	end;
	
	arbol=^nodo2;
		nodo2=record
			info3:postal;
			hi:arbol;
			hd:arbol;
		end;

{--------------------------------------------------------------------}
{a) implementar un modulo que lea envios, genere y retorne un 
arbol binario de busqueda ordenado por codigo postal, donde 
para cada codigo postal se almacenen en una lista todos los 
envios(codigo de cliente, dia y peso del paquete) correspondientes.
la lectura finaliza con codigo del cliente 0. se sugiere 
utilizar el modulo leerEnvio()}

procedure leerEnvio(var e:envio1);
begin
	e.codigo_cliente:= random(50);
	if (e.codigo_cliente <> 0) then begin
		e.dia:= random(31)+1;
		e.codigo_postal:= random(30);
		e.peso_paquete:= random(70); 
	end;
end;

procedure agregarLista(var l: lista; e: envio1);
var
  nuevo: lista;
begin
  new(nuevo);
  nuevo^.info1.cod_cli := e.codigo_cliente;
  nuevo^.info1.dia2 := e.dia;
  nuevo^.info1.peso := e.peso_paquete;
  nuevo^.sig := l;
  l := nuevo;
end;


procedure cargarNodoArbol(var a:Arbol; e:envio1);
var
	aux:arbol; 
begin
	if (a = nil) then begin
		new(a);
		a^.info3.cod_postal := e.codigo_postal;
		a^.info3.info2 := nil;
		agregarLista(a^.info3.info2, e);
		a^.hi := nil;
		a^.hd := nil;
	end
	else
	if (e.codigo_postal < a^.info3.cod_postal) then
		cargarNodoArbol(a^.hi, e)
	else if (e.codigo_postal > a^.info3.cod_postal) then
			cargarNodoArbol(a^.hd, e)
		else
			agregarLista(a^.info3.info2, e);  // si es el mismo postal, agrego a la lista
end;

procedure cargarEnvios(var a:arbol);
var
	e:envio1;
begin
	leerEnvio(e);
	while (e.codigo_cliente <> 0)do begin
		cargarNodoArbol(a,e);
		leerEnvio(e);
	end;
end;
{--------------------------------------------------------------------}
{b) implementar un modulo que reciba la estructura generada
en a) y un codigo postal y retorne todos los envios de 
dicho codigo postal.}

procedure retornarLista(a: arbol; postal: integer; var l: lista);
begin
  if (a = nil) then
    l := nil
  else if (a^.info3.cod_postal = postal) then
    l := a^.info3.info2
  else if (postal < a^.info3.cod_postal) then
    retornarLista(a^.hi, postal, l)
  else
    retornarLista(a^.hd, postal, l);
end;


{c) realizar un modulo recursivo que reciba la estructura que 
retorna el inciso b) y retorne los dos codigos de cliente
correspondientes al envio con mayor y menor peso.}

procedure calcular (l:lista; var codmax,codmin,max,min:integer);
begin
	if (l <> nil)then begin 
		if (l^.info1.peso < min)then begin
			codmin:= l^.info1.cod_cli;
			min:= l^.info1.peso;
		end;
		if (l^.info1.peso > max)then begin
			codmax:= l^.info1.cod_cli;
			max:= l^.info1.peso;
		end;
		calcular(l^.sig,codmax,codmin,max,min);
	end;
end;
{--------------------------------------------------------------------}


procedure imprimir(a: arbol);
begin
  if (a <> nil) then begin
    imprimir(a^.hi);
    writeln('Codigo postal: ', a^.info3.cod_postal);
    imprimir(a^.hd);
  end;
end;

{--------------------------------------------------------------------}
var
	a:arbol; post:integer; codmax,codmin,max,min:integer; l1:lista;
begin
	randomize;
	a:= nil; l1:= nil;
	cargarEnvios(a); //INCISO A
	imprimir(a); // PARA VERIFICAR
	writeln('Ingrese un codigo postal: '); readln(post); //INCISO B 
	retornarLista(a,post,l1); //INCISO B
	max:= -999; min:= 999; 
	calcular(l1,codmax,codmin,max,min); //	INCISO C 
	writeln('codigo maximo en la lista: ',codmax,', codigo minimo: ',codmin); //PARA VERIFICAR 
end.
