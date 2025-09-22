{el supermercado GranVariedad necesita un sistema para procesar la 
informacion de sus ventas. de cada venta se conoce: dni de cliente, 
codigo de sucursal(1 a 10), numero de factura y monto.

a) implementar un modulo que lea informacion de las ventas (la lectura
finaliza al ingresar dni de cliente 0) y retorne:

i. una estructura de datos eficiente para la busqueda por dni de 
cliente. para cada dni debe almacenarse una lista de todas sus compras
(numero de factura y monto)

ii. una estructura de datos que almacene la cantidad de ventas de cada
sucursal

b) realizar un modulo que reciba la estructura generada en el inciso
a) i., un monto y un dni. el modulo debe retornar la cantidad de 
facturas cuyo monto es superior al monto ingresador para el dni 
ingresado.

c) realizar un modulo recursivo que reciba la estructura generada en el 
inciso a) ii., y retorne el codigo de sucursal con mayor cantidad de
ventas.

nota: implementar el programa principal que invoque a los incisos a,b y c.}

{ venta de tipo REGISTRO
	campos: dni_cliente, cod_sucu:rangosucu(1..10), num_factura y monto
	
a) leo ventas 
	corte= dni_cliente = 0
	retornar: 
		*arbol ordenado por dni_cliente 
			campos: dni_cliente y una listaConmpra(numfact y monto)
		*vector (1..10) de tipo enteros(inicializar previamente)
		
b) parametros: arbol, un monto y un dni
	retornar: cantidad de facturas del dni ingresado cuyo monto sea superior
			  al monto ingresado por parametro 
	utilizo una funcion
	
c) Function RECURSIVO 
	parametros: vector, max
	debe devolver: codigo de sucursal con max cantidad de ventas }

program TE2025;
const
	maxsucu=10;
type
	rangosucursal=1..maxsucu;
	
	venta=record
		dni_cliente:integer;
		cod_sucu:rangosucursal;
		num_factura:integer;
		monto:real;
	end;
	
	factura=record
		numfact:integer;
		monto:real;
	end;
	
	lista=^nodolista;
		nodolista=record
			info:factura;
			sig:lista;
		end;
		
	cliente=record
		dni_cliente:integer;
		compras:lista;
	end;
	
	arbol=^nodoarbol; // INCISO A. i 
		nodoarbol=record
			info: cliente;
			hi:arbol;
			hd:arbol;
		end;
		
	vector=array[rangosucursal]of integer; //INCISO B. ii

{ venta de tipo REGISTRO
	campos: dni_cliente, cod_sucu:rangosucu(1..10), num_factura y monto
	
a) leo ventas 
	corte= dni_cliente = 0
	retornar: 
		*arbol ordenado por dni_cliente 
			campos: dni_cliente y una listaConmpra(numfact y monto)
		*vector (1..10) de tipo enteros(inicializar previamente)}
		
procedure inicializarVector(var v:vector);
var
	i:integer;
begin
	for i:= 1 to maxsucu do 
		v[i]:= 0;
end;

procedure leerVenta(var p:venta);
begin
	p.dni_cliente:= random(50);
	if (p.dni_cliente <>0)then begin
		p.cod_sucu:= random(10)+1;
		p.num_factura:= random(500)+1;
		p.monto:= random(600)+1;
	end;
end;
		
procedure agregarNodoLista(var l:lista; p:venta);
var
	aux:lista;
begin
	new(aux);
	aux^.info.numfact:= p.dni_cliente;
	aux^.info.monto:= p.monto;
	aux^.sig:= l;
	l:= aux;
end;

procedure agregarNodoArbol(var a:arbol; p:venta);
begin
	if (a=nil)then begin
		new(a);
		a^.info.dni_cliente:= p.dni_cliente;
		a^.info.compras:= nil;
		agregarNodoLista(a^.info.compras,p);
		a^.hi:= nil;
		a^.hd:= nil 
	end
	else if (p.dni_cliente < a^.info.dni_cliente)then agregarNodoArbol(a^.hi,p)
		else if (p.dni_cliente > a^.info.dni_cliente)then agregarNodoArbol(a^.hd,p)
			else agregarNodoLista(a^.info.compras,p);
end;

procedure cargarEstructuras(var a:arbol; var v:Vector);
var 
	p:Venta;
begin
	leerVenta(p);
	while(p.dni_cliente <> 0)do begin
		agregarNodoArbol(a,p);
		v[p.cod_sucu]:= v[p.cod_sucu] + 1;
		leerVenta(p);
	end;
end;		


{b) parametros: arbol, un monto y un dni
	retornar: cantidad de facturas del dni ingresado cuyo monto sea superior
			  al monto ingresado por parametro 
	utilizo una funcion
	* 
explicacion: 

Caso base → si el árbol está vacío, devuelvo 0.

Encontré el DNI → recorro la lista de compras, cuento cuántas facturas tienen monto > montoIngresado.

DNI menor → sigo buscando en el hijo izquierdo.

DNI mayor → sigo buscando en el hijo derecho.
*  }
	
function cantfacturas(a: arbol; monto: real ; dniBuscado: integer): integer;
var
  actual: lista;  
  cant: integer;
begin
  if (a = nil) then
    cantfacturas := 0
  else if (dniBuscado = a^.info.dni_cliente) then
  begin
    { Encontré el cliente, recorro su lista de compras }
    cant := 0;
    actual := a^.info.compras;
    while (actual <> nil) do
    begin
      if (actual^.info.monto > monto) then
        cant := cant + 1;
      actual := actual^.sig;
    end;
    cantfacturas := cant;
  end
  else if (dniBuscado < a^.info.dni_cliente) then
    cantfacturas := cantfacturas(a^.hi, monto, dniBuscado)
  else
    cantfacturas := cantfacturas(a^.hd, monto, dniBuscado);
end;


	
{c) Function RECURSIVO 
	parametros: vector, max
	debe devolver: codigo de sucursal con max cantidad de ventas }	
function sucursalmax(v:Vector; max:integer;pos:integer):integer;
begin
	if (pos <>0)then begin 
		if (v[pos] > max)then
			max:= v[pos];
		sucursalmax(v,max,pos-1);
	end;
	sucursalmax:= max;
end;

{---------------------------------------------------------------------}
procedure imprimirVector(v:Vector);
var
	i:integer;
begin
	for i:= 1 to 10 do 
		writeln('El valor de la posicion: ',i,' es: ',v[i]);
end;


procedure imprimirArbol(a:Arbol);
begin
	if (a <> nil)then begin 
		imprimirArbol(a^.hi);
		writeln('dni del cliente:',a^.info.dni_cliente);
		writeln('numero de factura: ',a^.info.compras^.info.numfact);
		writeln('monto: ',a^.info.compras^.info.monto:0:2);
		writeln('-------------------------------------------------');
		imprimirArbol(a^.hd);
	end;
end;

{----------------------------------------------------------------------}
var
	a:arbol; v:vector; dni:integer; monto:real; max:integer;pos:integer;
begin
	// INCISO A 
	a:= nil;
	inicializarVector(v);
	cargarEstructuras(a,v);
	imprimirArbol(a); //SOLO PARA VERIFICAR
	imprimirVector(v); //SOLO PARA VERIFICAR 
	
	//INCISO B 	
	writeln('ingrese un DNI: '); readln(dni);
	writeln('Ingrese un monto: ');readln(monto);
	writeln('La cantidad de facturas del dni ingresado con monto superior al ingresado es de: ',cantfacturas(a,monto,dni));

	//INCISO C 
	max:= -999; pos:= 10;
	writeln('el codigo de sucursal con mayor cantidad de ventas es: ',sucursalmax(v,max,pos));
end.
