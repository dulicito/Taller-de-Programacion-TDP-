{se lee la informacion de las compras realizadas por los clientes a un
supermercado en el año 2024. de cada compra se lee el codigo de cliente,
dia, numero de mes y monto gastado. la lectura finaliza cuando se lee el 
cliente con codigo 0.

a) realizar un modulo que lea informacion de las compras y retorne un 
arbol binario de busqueda ordenado por codigo de cliente. para cada codigo
de cliente, se debe almacenar un vector con el monto total gastado por dicho 
cliente en cada mes del año 2024.

b) realizar un modulo que reciba la estructura generada en a) y un codigo
de cliente y retorne el mes con mayor gasto de dicho cliente

c) realizar un modulo que reciba la estructura generada en a) y un numero 
de mes y retorne la cantidad de clientes que no gastaron nada en dicho mes.


compra de tipo REGISTRO
	campos: cod_cli, dia, num_mes, monto_gastado
	corte: cod_cli = 0
	
a) generar un ABB ordenado por codigo de cliente
	sus campos: codigo_cli y vector
		vector(1..12) de tipo real (guarda monto gastado por mes)

b) modulo procedimiento con parametros: arbol, codigo, 
	retorna: mes con mayor gasto (un integer)
	
c) modulo procedimiento con parametros: arbol y un mes
	retornar: cant de clientes que no gastaron nada en ese mes }
	
	
program TH2025;
const
	maxmes=12;
	maxdias=31;
type
	rangodias= 1..maxdias;
	rangomeses= 1..maxmes;
	
	compra=Record
		cod_cli:integer;
		dia:rangodias;
		num_mes:rangomeses;
		monto_gastado:real;
	end;
	
	vector=array[rangomeses]of real;
	
	cliente=Record
		codigo_cli:integer;
		monto:vector;
	end;
	
	arbol=^nodoarbol;
		nodoarbol=Record
			info: cliente;
			hi:Arbol;
			hd:arbol;
		end;
	
	
	
{compra de tipo REGISTRO
	campos: cod_cli, dia, num_mes, monto_gastado
	corte: cod_cli = 0
	
a) generar un ABB ordenado por codigo de cliente
	sus campos: codigo_cli y vector
		vector(1..12) de tipo real (guarda monto gastado por mes)}


procedure leerCompra(var c:compra);
begin
	c.cod_cli:= random(70);
	if (c.cod_cli <>0)then begin
		c.dia:= random(31)+1;
		c.num_mes:= random(12)+1;
		c.monto_gastado:= random(70);
	end;
end;

procedure inicializarvector(var v:vector);
var 	i:integer;
begin
	for i:= 1 to maxmes do
		v[i]:= 0;
end;

procedure cargarVector (var v:vector; mes:integer ;monto:real);
begin
	v[mes]:= v[mes]+ monto;
end;



procedure agregarNodoArbol(var a:arbol; c:compra);
begin
	if (a= nil)then begin
		new(a);
		a^.info.codigo_cli:= c.cod_cli;
		inicializarvector(a^.info.monto);
		cargarVector(a^.info.monto,c.num_mes,c.monto_gastado);
		a^.hi:= nil;
		a^.hd:= nil
	end
	else if (c.cod_cli < a^.info.codigo_cli)then agregarNodoArbol(a^.hi,c)
		else if (c.cod_cli > a^.info.codigo_cli)then agregarNodoArbol(a^.hd,c)
			else cargarVector(a^.info.monto,c.num_mes,c.monto_gastado);
end;


procedure generarArbol(var a:arbol);
var
	c:compra;
begin
	leerCompra(c);
	while (c.cod_cli <> 0)do begin
		agregarNodoArbol(a,c);
		leerCompra(c);
	end;
end;

{b) modulo function  con parametros: arbol, codigo, 
	retorna: mes con mayor gasto (un integer)}
	

function recorrer(v:vector):integer;
var i:integer; max:real; pos:integer;
begin
	max := -1; 
	pos := 1;
	for i := 1 to 12 do begin
		if (v[i] > max) then begin
			max := v[i];
			pos := i;
		end;
	end;
	recorrer := pos;
end;



function mesMax(a:arbol; codigo:integer):integer;
begin
	if (a = nil) then
		mesMax := -1 // cliente no encontrado
	else if (codigo < a^.info.codigo_cli) then
		mesMax := mesMax(a^.hi, codigo)
	else if (codigo > a^.info.codigo_cli) then
		mesMax := mesMax(a^.hd, codigo)
	else
		mesMax := recorrer(a^.info.monto); // lo encontroo
end;


{c) modulo function con parametros: arbol y un mes
	retornar: cant de clientes que no gastaron nada en ese mes }
	
function cantidadNoGasto(a:arbol; mes:integer):integer;
begin
	if (a = nil) then
		cantidadNoGasto := 0
	else begin
		cantidadNoGasto := cantidadNoGasto(a^.hi, mes) + cantidadNoGasto(a^.hd, mes);
		if (a^.info.monto[mes] = 0) then
			cantidadNoGasto := cantidadNoGasto + 1;
	end;
end;

{----------------------------------------------------------------------}	
		
procedure imprimirArbol(a:arbol);
var
	vec:vector; i:integer;
begin
	if (a <> nil)then begin 
		imprimirArbol(a^.hi);
		writeln(a^.info.codigo_cli);
		vec:= a^.info.monto;
		for i:= 1 to 12 do 
			writeln(vec[i]:2:2);
		imprimirArbol(a^.hd);
	end;
end;


var
	a:arbol; codigo:integer; mes:rangomeses; 
begin
	//INCISO A 
	randomize;
	a:= nil;
	generarArbol(a);
	imprimirArbol(a); //USADO PARA VERIFICAR, NO LO PIDE EL PROGRAMA 
	
	//INCISO B 
	
	writeln('Ingrese un codigo de cliente: '); readln(codigo);
	writeln('El mes con mayor gasto fue de: ',mesmax(a,codigo));
	
	//INCISO C 
	writeln('Ingrese un mes: ');readln(mes);
	writeln('La cantidad de clientes que no gastaron nada durante el mes ingresado fue de: ',cantidadNoGasto(a,mes));

end.
