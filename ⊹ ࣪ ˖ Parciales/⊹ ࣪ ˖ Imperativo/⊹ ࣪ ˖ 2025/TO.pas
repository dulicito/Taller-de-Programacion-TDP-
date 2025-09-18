{MrStore requiere procesar las compras realizadas por sus clientes 
durante el año 2024. 

a) implementar un modulo que lea compras de productos. de cada compra 
se lee codigo de producto, codigo de cliente, dia y mes. la lectura 
finaliza con el codigo de cliente 0. se sugiere utilizar el modulo 
leerCompra(). el modulo debe retornar un vector donde se almacenen 
las compras agrupadas por mes. las compras de cada mes deben quedar 
almacenadas en un arbol binario de busqueda ordenado por codigo de 
producto.

b) implementar un modulo recursivo que reciba el vector generado en a)
y retorne el mes con mayor cantidad de compras.

c) implementar un modulo que reciba el vector generado en a), un numero
de mes y un codigo de producto y retorne si fue comprado o no el 
producto ingresado en el mes recibido.

nota: implementar el programa principal, que invoque a los incisos 
a,b y c.}


{compra es de tipo REGISTRO
	campos: codigo_producto; codigo_cliente, dia, mes 
	
	corte= codigo_cliente: 0
	
a ) RETORNAR vector(meses) of Arbol ordenado por codigo_producto
	
b ) MODULO RECURSIVO
	parametros: vector
	usare una function
	debe DEVOLVER mes con mayor cantidad de compras 
	
c ) MODULO NORMAL O RECURSIVO 
	parametros: vector, numeromes, codigoproducto
	retornar: si fue comprado o no el producto en el mes recibido
	usare una function que devuelve un boolean }
	
program T02025;
type
	rangodias= 1..31;
	rangomeses= 1..12;
	
	compra=Record 
		codigo_producto:integer;
		codigo_cliente:integer;
		dia:rangodias;
		mes:rangomeses;
	end;	
		
	arbol=^nodoarbol;
		nodoarbol=record
			info: compra;
			hi:arbol;
			hd:arbol;
		end;
		
	vector=array[rangomeses] of arbol;
	

{compra es de tipo REGISTRO
	campos: codigo_producto; codigo_cliente, dia, mes 
	
	corte= codigo_cliente: 0
	
a ) RETORNAR vector(meses) of Arbol ordenado por codigo_producto}
	
procedure inicializarVector(var v:Vector);
var
	i:integer;
begin
	for i:= 1 to 12 do 
		v[i]:= nil;
end;

procedure leerCompra (var c:compra);
begin
	c.codigo_cliente:= random(100);
	if (c.codigo_cliente <> 0 )then begin
		c.codigo_producto:= random(100)+1;
		c.dia:= random(31)+1;
		c.mes:= random(12)+1;
	end;
end;

procedure agregarNodoArbol(var a:Arbol; c:compra);
begin
	if (a=nil)then begin
		new(a);
		a^.info.codigo_cliente:= c.codigo_cliente;
		a^.info.codigo_producto:= c.codigo_producto;
		a^.info.dia:= c.dia;
		a^.info.mes:= c.mes;
		a^.hi:= nil;
		a^.hd:= nil
	end 
	else if (c.codigo_producto < a^.info.codigo_producto)then agregarNodoArbol(a^.hi,c)
		else if (c.codigo_producto > a^.info.codigo_producto)then agregarNodoArbol(a^.hd,c);
end;

procedure cargarVector(var v:Vector);
var
	c:compra;
begin
	leerCompra(c);
	while (c.codigo_cliente <>0)do begin
		agregarNodoArbol(v[c.mes],c);
		leerCompra(c);
	end;
end;

{b ) MODULO RECURSIVO
	parametros: vector
	usare una function
	debe DEVOLVER mes con mayor cantidad de compras }
	
procedure recorrerPos(a:Arbol; var cant:integer);
begin
	if (a <> nil)then begin
		recorrerPos(a^.hi,cant);
		
		cant:= cant + 1;
		
		recorrerPos(a^.hi,cant);
	end;
end;

function mesMax(v:Vector; max:integer;i:integer):integer;
var
	actual:arbol; cant:integer;
begin

	if i <>0 then begin
		actual:= v[i]; cant:= 0;
		recorrerPos(actual,cant);
		if (cant > max)then 
			max:= cant;
		mesMax(v,max,i-1);
	end;
	mesMax:= max;
end;

{c ) MODULO NORMAL O RECURSIVO 
	parametros: vector, numeromes, codigoproducto
	retornar: si fue comprado o no el producto en el mes recibido
	usare una function que devuelve un boolean }
	
procedure recorrerArbol(a:Arbol; var ok:boolean;cod:integer);
begin
	if (a<> nil) then begin
		if (ok = false)then begin 
			recorrerArbol(a^.hi,ok,cod);
		
			if (a^.info.codigo_producto = cod)then
				ok:= true;
		
			recorrerArbol(a^.hd,ok,cod);
		end;
	end;
end;

function seEncontro(v:vector; num_mes,cod_prod:integer):boolean;
var
	actual:arbol; ok:boolean;
begin
	actual:= v[num_mes];
	ok:= false;
	recorrerArbol(actual,ok,cod_prod);
	seEncontro:= ok; 
end;

{----------------------------------------------------------------------}
	
procedure imprimirArbol(a:arbol);
begin
	if (a<> nil)then begin
		imprimirArbol(a^.hi);
		
		writeln('codigo del producto: ',a^.info.codigo_producto);
		writeln('codigo del cliente: ',a^.info.codigo_cliente);
		writeln('dia: ',a^.info.dia);
		writeln('mes: ',a^.info.mes);

		imprimirArbol(a^.hd);
	end;
end;

procedure imprimirVector(v:Vector);
var
	i:integer; actual:arbol;
begin
	for i:= 1 to 12 do begin
		writeln('Mes nro: ',i);
		actual:= v[i];
		imprimirArbol(actual);
		writeln('-----------------------------------------------------');
	end;
end;
{----------------------------------------------------------------------}
var
	v:Vector; max,cod_prod,num_mes:integer; pos:integer;
begin
	//INCISO A 
	randomize;
	inicializarVector(v);
	cargarVector(v);
	imprimirVector(v); //USADO SOLO PARA VERIFICAR
	
	//INCISO B 
	max:= -999; pos:= 12;
	writeln('El mes con mayor cantidad de compras es: ',mesMax(v,max,pos));
	
	//INCISO C 
	writeln('Ingrese un codigo de producto: ');readln(cod_prod);
	writeln('Ingrese un mes(entre 1 y 12): '); readln(num_mes);
	if (seEncontro(v,num_mes,cod_prod))then
		writeln('El producto fue comprado')
	else writeln('no fue comprado.');
end.
