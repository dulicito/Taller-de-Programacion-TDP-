{la empresa "Rapidisima" necesita procesar los envios entregados durante
2024. de cada envio se conoce el codigo del cliente, mes, codigo postal 
de destino.

a) implementar un modulo que lea envios, genere y retorne un arbol binario
de busqueda ordenado por codigo postal, donde para cada codigo postal se 
almacenan los paquetes organizados por mes. la lectura finaliza con codigo
cliente 0. se sugiere utilizar el modulo leerEnvio().

b) implementar un modulo que reciba la estructura generada en a), un codigo
postal y un valor entero y retorne la cantidad de meses cuya cantidad de 
envios sea igual al valor ingresado

c) realizar un modulo que reciba la estructura generada en a) , dos codigos
postales y retorne una estructura con los codigos postales(entre los dos
codigos ingresados(sin incluirlos) con al menos 1 mes sin envios}

{errores que cometi previamente: 
* pensar que la estructura era un arbol>vector>registro:

  los nervios me jugaron en contra y no me puse a analizar la posibilidad
  que por mes podia tener mas de un paquete guardado, o incluso no tener
  ningun paquete guardado.
  
* recorrer todo el arbol: 

  cuando el arbol esta ordenado debemos aprovechar ese orden, DESAPROBADO
  POR SALAME SI RECORRES TODO EL ARBOL :"""v

* usar una funcion para recorrer entre un rango de numeros de un arbol
  (INCISO C ):
  
  para recorrer un arbol entre dos codigos, yo implemente una funcion
  que me devolvia un boolean si el valor del nodo estaba dentro de ese
  rango, ERROR QUE BAJA PUNTOS, deberia haber sido un if (valor>cod1)
  y dentro del primer if agregar otro if (valor <cod2) 
  
  
  pero bueno, todos cometemos errores, el de mi mama tenerme y yo el de
  desaprobar el modulo imperativo UnU
  
  se puede salvar el examen si el inciso A esta perfecto, sino F}


{la estructura que se usa en el parcial fue de:
	arbol > vector > lista

envio es un registro 
	campos: codigo_cliente, mes, codigo_postal_destino 
	
a ) retornar la estructura en un procedimiento 
	
	leo envio 
	mientras (e.codigo_cliente <> 0)
		agregonodo(paso arbol y envio)
		leo otro envio }

{b ) function con parametros: arbol, codigo postal, valor 
	retornar: cantidad de meses con cant envios = valor}
	
{c ) procedimiento con parametros: arbol, cod1,cod2, lista(cargar y devolver)
	retornar: lista ya cargada
	condicion: con al menos 1 mes sin envios }


program tktlparcial2025;

type
	rangomeses= 1..12;
	
	envio=Record
		codigo_cliente:integer;
		mes:rangomeses;
		codigo_postal:integer;
	end; 
			

	lista=^nodolista; //PARTE DE INCISO A PERO TAMBIEN REUTILIZABLE PARA HACER EL INCISO C ^^
		nodolista=Record
			cliente:integer; 
			sig:lista;
		end;
	
	vector=array[rangomeses] of lista;
	
	postal=Record
		codigo_postal:integer;
		paquetespormes: vector;
	end; 
	
	arbol=^nodoarbol;  // INCISO A 
		nodoarbol=record
			info:postal;
			hi:Arbol;
			hd:Arbol;
		end;
		
		
{la estructura que se usa en el parcial fue de:
	arbol > vector > lista

envio es un registro 
	campos: codigo_cliente, mes, codigo_postal_destino 
	
a ) retornar la estructura en un procedimiento 
	
	leo envio 
	mientras (e.codigo_cliente <> 0)
		agregonodo(paso arbol y envio)
		leo otro envio }


procedure leerEnvio(var e:envio);
begin
	e.codigo_cliente:= random(70);
	if (e.codigo_cliente <> 0 )then begin
		e.mes:= random(12)+1;
		e.codigo_postal:= random(500)+1;
	end;
end;

procedure inicializarVector( var v:vector);
var
	i:integer;
begin
	for i:= 1 to 12 do 
		v[i]:= nil;
end;

function agregarNodoLista( codigocli:integer):lista;
var	
	aux:lista;
begin
	new(aux);
	aux^.cliente:= codigocli;
	aux^.sig:= nil;
	agregarNodoLista:= aux;
end;
		
procedure agregarNodoArbol(var a:arbol; e:envio);
begin
	if (a = nil)then begin
		new(a);
		a^.info.codigo_postal:= e.codigo_postal;
		inicializarVector(a^.info.paquetespormes);
		a^.info.paquetespormes[e.mes]:= agregarNodoLista(e.codigo_cliente); //ver despues 
		a^.hi:= nil;
		a^.hd:= nil
	end
	else if (e.codigo_postal < a^.info.codigo_postal)then agregarNodoArbol(a^.hi, e)
		else if (e.codigo_postal > a^.info.codigo_postal)then agregarNodoArbol(a^.hd, e)
			else a^.info.paquetespormes[e.mes]:= agregarNodoLista( e.codigo_cliente); //ACA ASUMO QUE SE INGRESO EL MISMO CODIGO POSTAL :3 
end;

procedure cargarEstructura (var a:arbol);
var
	e:envio;
begin
	leerEnvio(e);
	while (e.codigo_cliente <>0)do begin
		agregarNodoArbol(a,e);
		leerEnvio(e);
	end;
end;
{b ) function con parametros: arbol, codigo postal, valor 
	retornar: cantidad de meses con cant envios = valor de ese codigo postal }
	
function cantMeses(a:Arbol;codpostal,valor:integer):integer;
var
	i,cant,meses:integer;
	aux:lista;
begin
	//CASO BASE
	if ( a = nil)then 
		cantMeses:= 0
		
	//BUSCA EN EL HI
	else if (codpostal < a^.info.codigo_postal)then 
			cantMeses:= cantMeses(a^.hi,codpostal,valor)
			
	//BUSCA EN EL HD
	else if (codpostal < a^.info.codigo_postal)then 
			cantMeses:= cantMeses(a^.hd,codpostal,valor)
			
	//ENCONTRE EL NODO WUJUUUU 
	else begin
		meses:= 0;
		for i:= 1 to 12 do begin
			cant:= 0;
			aux:= a^.info.paquetespormes[i];
			
			while (aux<>nil)do begin
				cant:= cant +1;
				aux:= aux^.sig;
			end;
			
			if (cant = valor)then 
				meses:= meses + 1;
		end;
		cantMeses:= meses;
	end;
end;

{c ) procedimiento con parametros: arbol, cod1,cod2, lista(cargar y devolver)
	retornar: lista ya cargada
	condicion: con al menos 1 mes sin envios }
	
function sinEnvios(v:Vector):boolean;
var
	cant,i:integer; 
begin
	cant:= 0;
	for i := 1 to 12 do begin
		if (v[i] = nil)then 
			cant:= cant + 1;
	end;
	if (cant >= 1)then
		sinEnvios:= true
	else sinEnvios:= false;
end;

procedure cargarLista(a:arbol;cod1,cod2:integer;var l:lista);
var
	envios:vector;
begin
	if (a <>nil)then begin
		if (a^.info.codigo_postal > cod1)then 
			cargarLista(a^.hi,cod1,cod2,l);
			
		if (a^.info.codigo_postal > cod1)then begin
			if (a^.info.codigo_postal < cod2)then begin
				envios:= a^.info.paquetespormes;
				if (sinEnvios(envios))then 
					l:= agregarNodoLista(a^.info.codigo_postal); //reutilizo codigo OwO
			end;
		end;
				
	    if (a^.info.codigo_postal < cod2)then 
			cargarLista(a^.hd,cod1,cod2,l);
	end;
end;

{----------------------------------------------------------------------}

procedure imprimirLista(l:lista);
begin
	while (l <>nil)do begin
		writeln('Codigo cliente: ',l^.cliente);
		writeln('-----------------------------------');
		l:= l^.sig;
	end;
end;
		
procedure recorrerVector( v:Vector);
var
	i:integer; mes:lista;
begin
	for i:= 1 to 12 do begin
		writeln('Mes nro: ',i);
		mes:= v[i];
		imprimirLista(mes); //aprovecho el otro modulo y reutilizo codigo (:3)/!
	end;
end;		
		
procedure imprimirArbol(a:arbol);
var
	vec:Vector;
begin
	if (a<> nil)then begin
		imprimirArbol(a^.hi);
		
		writeln('Codigo postal: ',a^.info.codigo_postal);
		vec:= a^.info.paquetespormes;
		recorrerVector(vec);
		writeln('------------------------------------------------');
		
		imprimirArbol(a^.hd);
	end;
end;

{----------------------------------------------------------------------}
var
	a:arbol; codpostal,valor,cod1,cod2:integer; l:lista;
begin
	//INCISO A
	randomize;
	a:= nil;
	cargarEstructura(a); 
	imprimirArbol(a); //no lo pide el enunciado pero sirve para verificar 
	
	//INCISO B 
	writeln('Ingrese un codigo postal: '); readln(codpostal);
	writeln('Ingrese ahora un valor: '); readln(valor);
	writeln('La cantidad de meses con cantidad de envios igual a ',valor,' fue de ',cantMeses(a,codpostal,valor));
	
	//INCISO C 
	writeln('Ingrese el principio del rango: ');readln(cod1);
	writeln('Ingrese el final del rango: ');readln(cod2);
	l:= nil;
	cargarLista(a,cod1,cod2,l);
	imprimirLista(l); //no lo pide el enunciado pero sirve para verificar 
end.
