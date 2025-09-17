{un supermercado consumo necesita un sistema para procesar la informacion
de sus ventas. de cada venta se conoce: dni del cliente, codigo de sucursal
(1..10), numero de factura y monto.

a) implementar un modulo que lea informacion de las ventas(la lectura
finaliza al ingresar codigo de cliente 0  y retorne:

i) una estructura de datos eficiente para la busqueda por dni de cliente.
para cada dni debe almacenarse todas sus compras(numero de factura y monto)

ii) una estructura de datos que almacene la cantidad de ventas de cada 
sucursal

b) realizar un modulo que reciba la estructura generada en el inciso a)i,
un monto y un dni. el modulo debe retornar la cantidad de facturas cuyo
monto es inferior al monto ingresado para el dni ingresado

c) realizar un modulo recursivo que reciba la estructura generada en el
inciso a)ii y un valor entero y retorne si existe o no una sucursal con 
cantidad de ventas igual al valor recibidol

nota: implementar el programa principal, que invoque a los incisos a,b y c.}


{venta es de tipo REGISTRO
	con campos: dni_cliente, cod_sucu(1..10),numfact,monto
	
a) procedimiento cargarestructuras
		retornar:
			arbol con campos: dni cliente y lista compras(num factura y monto)
			vector(1..10) de enteros (inicializarlo previamente)
					almacena cantidad de ventas de cada sucursal 

b) procedimiento con parametros: arbol, un monto y un dni por teclado, cantfacturas
	retornar: cuántas facturas de ese cliente tienen un monto menor al ingresado
	
c) function que devuelve un boolean
	parametros: vector, valor
	retorna: true si existe una sucursal con cant ventas igual a valor}
	
program TL2025;
const
	maxsucu=10;
type
	rangosucursales= 1..maxsucu;
	
	venta=record
		dni_cliente:integer;
		cod_sucu:rangosucursales;
		numfact:integer;
		monto:real;
	end;
	
	venta2=record
		num_fact:integer;
		mont:real;
	end;
	
	lista=^nodolista;
		nodolista=Record
			info:venta2;
			sig:lista;
		end;
			
			
	cliente=record
		dni_cli:integer;
		compras:lista;
	end;
	
	arbol=^nodoarbol; //INCISO A.i
		nodoarbol=record
			info:cliente;
			hi:arbol;
			hd:arbol;
		end;
		
	vector=array[rangosucursales]of integer;

{venta es de tipo REGISTRO
	con campos: dni_cliente, cod_sucu(1..10),numfact,monto
	
a) procedimiento cargarestructuras
		retornar:
			arbol con campos: dni cliente y lista compras(num factura y monto)
			vector(1..10) de enteros (inicializarlo previamente)
					almacena cantidad de ventas de cada sucursal }

procedure inicializarVector(var v:vector);
var i:integer;
begin
	for i:= 1 to maxsucu do 
		v[i]:= 0;
end;


procedure leerVenta(var p:venta);
begin
	p.dni_cliente:= random(60);
	if (p.dni_cliente <> 0)then begin
		p.cod_sucu:= random(maxsucu)+1;
		p.numfact:= random(50);
		p.monto:= random(80);
	end;
end;

procedure cargarComprasLista(var l: lista;p:venta);
var aux:lista;
begin
	new(aux);
	aux^.info.num_fact:= p.numfact;
	aux^.info.mont:= p.monto;
	aux^.sig:= l;
	l:= aux;
end;
		
procedure agregarnodoArbol(var a:Arbol; p:venta);
begin
	if (a = nil)then begin
		new(a);
		a^.info.dni_cli:= p.dni_cliente;
		a^.info.compras:= nil;
		cargarComprasLista(a^.info.compras,p);
		a^.hi:= nil;
		a^.hd:= nil
	end
	else if (p.dni_cliente > a^.info.dni_cli)then agregarnodoArbol(a^.hd,p)
		else if (p.dni_cliente < a^.info.dni_cli)then agregarnodoArbol(a^.hi,p)
			else cargarComprasLista(a^.info.compras,p);
end;


procedure cargarEstructuras(var a:arbol; var v:vector); // INCISO A 
var
	p:venta;
begin
	leerVenta(p);
	while (p.dni_cliente <> 0)do begin
		agregarnodoArbol(a,p);
		v[p.cod_sucu]:= v[p.cod_sucu]+1;
		leerVenta(p);
	end;
end;


{b) function con parametros: arbol, un monto y un dni por teclado, cantfacturas
	retornar: cuántas facturas de ese cliente tienen un monto menor al ingresado}
	
function calcularFacturas(a:arbol; monto:real; dni:integer):integer;
var
	l: lista;
	cant: integer;
begin
	if (a = nil)then
		calcularFacturas:= 0
	else if (dni = a^.info.dni_cli)then begin
		cant:= 0;
		l:= a^.info.compras;
		while (l <> nil) do begin
			if (l^.info.mont < monto) then
				cant:= cant + 1;
			l:= l^.sig;
		end;
		calcularFacturas:= cant;
	end
	else if (dni < a^.info.dni_cli)then
		calcularFacturas:= calcularFacturas(a^.hi, monto, dni)
	else
		calcularFacturas:= calcularFacturas(a^.hd, monto, dni);
end;


{c) function RECURSIVO que devuelve un boolean
	parametros: vector, valor
	retorna: true si existe una sucursal con cant ventas igual a valor}

function existe(v:vector; valor:integer; cant:integer):boolean; //INCISO C 
begin
	if (cant = 0)then 
		existe:= false
	else if (v[cant]=valor)then 
		existe:= true
	else
		existe:= existe(v,valor,cant-1);
	
end;


{IMPRESIONES ESTO ES PARA VERIFICAR}

procedure imprimirVector(v:Vector);
var i:rangosucursales;
begin
	for i:= 1 to maxsucu do
		writeln('posicion del vector: ',i,', tiene: ',v[i]);
end;

	
procedure imprimirArbol(a:Arbol);
var l:lista;
begin
	if (a<>nil)then begin
		imprimirArbol(a^.hi);
		writeln(a^.info.dni_cli);
		l:= a^.info.compras;
		while (l<> nil)do begin
			writeln(l^.info.num_fact);
			writeln(l^.info.mont:0:2);
			l:= l^.sig;
		end;
		imprimirArbol(a^.hd);
	end;
end;


var
	a:arbol; v:vector; dni:integer; monto:Real; valor:integer; x:boolean; cant:integer;
begin
	//INCISO A
	randomize;
	a:= nil;
	inicializarVector(v);
	cargarEstructuras(a,v);
	imprimirArbol(a); //SOLO PARA VERIFICAR
	imprimirVector(v); //SOLO PARA VERIFICAR
	
	//INCISO B 
	writeln('ingrese un dni: ');readln(dni);
	writeln('Ingrese un monto: ');readln(monto);
	if (a = nil)then
		writeln('El arbol esta vacio')
	else writeln('La cantidad de facturas de ese cliente con monto menor al ingresado es de: ',calcularfacturas(a,monto,dni));
	
	//INCISO C 
	writeln('Ingrese un valor para encontrar en el vector');readln(valor);
	cant:= maxsucu;
	x:= existe(v,valor,cant);
	if (x = false )then
		writeln('no se encontro una sucursal con la cantidad de ventas igual al valor')
	else writeln('se encontro!')
end.
