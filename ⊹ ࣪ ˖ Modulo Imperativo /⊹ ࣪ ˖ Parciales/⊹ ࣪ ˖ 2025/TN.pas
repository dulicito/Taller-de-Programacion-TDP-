{una empresa gastronomica requiere el procesamiento de las entregas de 
comida realizadas a sus clientes durante el mes de mayo de 2025.

a) implemente un modulo que lea entregas de comidas. de cada compra 
se lee codigo de comida, codigo de cliente, dia y categoria de la 
entrega(de 1 a 5). la lectura finaliza con el codigo de cliente 0. 
se sugiere utilizar el modulo leerEntrega(). se deben retornar 2 
estructuras de datos:
i. un arbol binario de busqueda ordenado por codigo de comida. para 
cada codigo de comida deben almacenarse las entregas realizadas a 
ese codigo.

ii. un vector que almacene, para cada categoria, la cantidad de 
entregas realizadas.

b) implementar un modulo que reciba el arbol generado en a) i. y dos
codigos de comida y un valor entero. el modulo debe retornar la cantidad 
de entregas realizadas al cliente con dni igual al valor ingresado 
para comidas con codigos entre los dos codigos ingresados(sin incluir)

c) implementar un modulo recursivo que reciba el vector generado en 
a) ii. y un valor entero. el modulo debe retornar si existe o no una 
categoria con cantidad de entregas igual al valor ingresado.

nota: implementar el programa principal, que invoque a los incisos a,b y c.}


{ a ) compra es un REGISTRO
	campos: codigo_comida, codigo_cliente, dni, categoria_entrega(1..5)
	corte= codigo_cliente = 0
	
se debe RETORNAR:
	* un ARBOL ordenado por codigo de comida 	
			campos: codigo_comida, listaEntregas (cliente,dni,entrega(1..5)
			
	* VECTOR(1..5) de integer
			guarda: cantidad de entregas realizadas}

{b ) function con parametros: arbol, codigo1, codigo2 y un valor
	retornar: cantidad de entregas del dni (valor) entre codigo 1 y codigo 2}
	
{c ) function con parametros: vector, un valor2
	retornar: boolean, si existe o no una categoria con cantidad de entregas
						igual a valor2}
program TN2025;
type
	subrangocategorias=1..5;
	compra=Record
		codigo_comida:integer;
		codigo_cliente:integer;
		dni:integer;
		categoria_entrega:subrangocategorias;
	end;
	
	entrega=Record
		cliente:integer;
		dni:integer;
		entrega:subrangocategorias;
	end;
	
	lista=^nodolista;
		nodolista=Record
			info:entrega;
			sig:lista;
		end;
		
	comidas=Record
		codigo_comida:integer;
		entregas:lista;
	end;
	
	arbol=^nodoarbol; // INCISO A. i.
		nodoarbol=record
			info:comidas;
			hi:arbol;
			hd:arbol;
		end;
	vector=Array[subrangocategorias]of integer;
	
	
{ a ) compra es un REGISTRO
	campos: codigo_comida, codigo_cliente, dni, categoria_entrega(1..5)
	corte= codigo_cliente = 0
	
se debe RETORNAR:
	* un ARBOL ordenado por codigo de comida 	
			campos: codigo_comida, listaEntregas (cliente,dni,entrega(1..5)
			
	* VECTOR(1..5) de integer
			guarda: cantidad de entregas realizadas}

procedure inicializarVector(var v:vector);
var
	i:integer;
begin
	for i:= 1 to 5 do 
		v[i]:= 0;
end;

procedure leerCompra(var c:compra);
begin
	c.codigo_cliente:= random(500);
	if (c.codigo_cliente <> 0)then begin
		c.codigo_comida:= random(70)+1;
		c.dni:= random(60)+1;
		c.categoria_entrega:= random(5)+1;
	end;
end;

procedure agregarNodoLista (var l:lista; c:compra);
var
	aux: lista;
begin
	new(aux);
	aux^.info.cliente:= c.codigo_cliente;
	aux^.info.dni:= c.dni;
	aux^.info.entrega:=c.categoria_entrega;
	aux^.sig:= l;
	l:= aux;
end;


procedure agregarNodoArbol(var a:Arbol; c:compra);
begin
	if (a=nil)then begin
		new(a);
		a^.info.codigo_comida:= c.codigo_comida;
		a^.info.entregas:= nil;
		agregarNodoLista(a^.info.entregas,c);
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else if (c.codigo_comida < a^.info.codigo_comida)then agregarNodoArbol(a^.hi,c)
		else if (c.codigo_comida > a^.info.codigo_comida)then agregarNodoArbol(a^.hd,c)
			else agregarNodoLista(a^.info.entregas,c);
end;

procedure generarEstructuras(var a:arbol; var v:vector);
var
	c:compra;
begin
	leerCompra(c);
	while (c.codigo_cliente <> 0)do begin
		agregarNodoArbol(a,c);
		v[c.categoria_entrega]:= v[c.categoria_entrega]+1;
		leerCompra(c);
	end;
end;


{b ) function con parametros: arbol, codigo1, codigo2 y un valor
	retornar: cantidad de entregas del dni (valor) entre codigo 1 y codigo 2}
	
	
function contarEntregas(l:lista; dni:integer):integer;
var cant:integer;
begin
  cant:=0;
  while (l<>nil) do begin
    if (l^.info.dni = dni) then cant:=cant+1;
    l:=l^.sig;
  end;
  contarEntregas:=cant;
end;

function IncisoB(a:arbol; cod1,cod2:integer; dni:integer):integer;
begin
  if (a=nil) then IncisoB:=0
  else begin
    if (a^.info.codigo_comida > cod1) and (a^.info.codigo_comida < cod2) then
      IncisoB:= contarEntregas(a^.info.entregas,dni)
                + IncisoB(a^.hi,cod1,cod2,dni)
                + IncisoB(a^.hd,cod1,cod2,dni)
    else if (a^.info.codigo_comida <= cod1) then
      IncisoB:= IncisoB(a^.hd,cod1,cod2,dni)
    else
      IncisoB:= IncisoB(a^.hi,cod1,cod2,dni);
  end;
end;


{c ) function RECURSIVO con parametros: vector, un valor2
	retornar: boolean, si existe o no una categoria con cantidad de entregas
						igual a valor2}
						
function existe(v:Vector; valor:integer; dl:integer):boolean;
begin
  if (dl=0) then existe:=false
  else if (v[dl]=valor) then existe:=true
  else existe:=existe(v,valor,dl-1);
end;
{----------------------------------------------------------------------}

				
procedure imprimirArbol(a:arbol);
var
	act:lista;
begin
	if (a <> nil)then begin	
		imprimirArbol(a^.hi);
		writeln('codigo de comida: ',a^.info.codigo_comida);
		act:= a^.info.entregas;
		while (act <> nil)do begin
			writeln('codigo de cliente:',act^.info.cliente);
			writeln('dni: ',act^.info.dni);
			writeln('entrega: ',act^.info.entrega);
			writeln('------------------------------------');
			act:= act^.sig;
		end;
		writeln('-------------------------------------------------');
		imprimirArbol(a^.hd);
	end;
end;

			
procedure imprimirVector(v:Vector);
var
	i:integer; 
begin
	for i:= 1 to 5 do 
		writeln('La cantidad de entregas en la posicion: ',i,' es de: ',v[i]);
end;

{----------------------------------------------------------------------}

var
	a:arbol; v:Vector; valor1,valor2:integer; cod1,cod2:integer;dl:integer;
begin
	//INCISO A 
	randomize;
	a:= nil;
	inicializarVector(v);
	generarEstructuras(a,v);
	imprimirArbol(a); //USADO SOLO PARA VERIFICAR, NO LO PIDE EL ENUNCIADO 
	imprimirVector(v);//USADO SOLO PARA VERIFICAR, NO LO PIDE EL ENUNCIADO 
	
	//INCISO B
	writeln('Ingrese un dni: '); readln(valor1);
	writeln('Ingrese el comienzo del rango: '); readln(cod1);
	writeln('Ingrese el final del rango: ');readln(cod2);
	writeln('La cantidad de entregas que se encuentra en el rango ingresado con ese dni es de: ',IncisoB(a,cod1,cod2,valor1));
	
	//INCISO C
	writeln('Ingrese una cantidad de entregas para buscar en el vector: '); readln(valor2);
	dl:=5;
	if (existe(v,valor2,dl))then 
		writeln('Existe la cantidad de entregas')
	else writeln('No existe.')
end.
