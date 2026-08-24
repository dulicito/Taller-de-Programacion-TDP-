{4.- Una librería requiere el procesamiento de la información de sus 
productos. De cada producto se conoce el código del producto, código 
de rubro (del 1 al 6) y precio.

Implementar un programa que invoque a módulos para cada uno de los 
siguientes puntos:

a. Lea los datos de los productos y los almacene ordenados por código 
de producto y agrupados por rubro, en una estructura de datos adecuada. 
El ingreso de los productos finaliza cuando se lee el precio -1.

b. Una vez almacenados, muestre los códigos de los productos pertenecientes 
a cada rubro.

c. Genere un vector (de a lo sumo 20 elementos) con los productos del 
rubro 3. Considerar que puede haber más o menos de 20 productos del 
rubro 3. Si la cantidad de productos del rubro 3 es mayor a 20, almacenar 
los primeros 20 que están en la lista e ignore el resto. MODIFICADO 

d. Ordene, por precio, los elementos del vector generado en c) utilizando 
alguno de los dos métodos vistos en la teoría

e. Muestre los precios del vector resultante del punto d).

f. Calcule el promedio de los precios del vector resultante del punto d).}


program ej4p1;
const
    maxrubro= 6;
type
    rango_rubro=1..maxrubro;
    producto= record 
        codigo:integer;
        codigo_rubro:rango_rubro;
        precio: real;
    end;
    
    lista_productos=^nodo;
        nodo=record
            info:producto;
            sig:lista_productos;
        end;
        
    vector= array [rango_rubro] of lista_productos;
    
    rubro3= array[1..20]of producto;

{-----------------------------------------------------------------------------}

procedure inicializar (var v:vector);
var
    i:rango_rubro;
begin
    for i:= 1 to maxrubro do 
        v[i]:= nil;
end;

procedure leerProducto (var p:producto);
begin
    p.precio:= random (102)-1; {genera numeros entre -1 (el corte de control)y el 100}
    if (p.precio <> -1)then begin 
        p.codigo:= random(100)+1; {usado de ejemplo}
        p.codigo_rubro:= random(6)+1;
    end;
end;

procedure insertarOrdenado(var l: lista_productos; p: producto);
var
  nuevo, actual, anterior: lista_productos;
begin
  new(nuevo);
  nuevo^.info := p;
  nuevo^.sig := nil;

  // Si la lista esta vacia o el nuevo codigo es menor al primero
  if (l = nil) or (p.codigo < l^.info.codigo) then
  begin
    nuevo^.sig := l;
    l := nuevo;
  end
  else
  begin
    anterior := l;
    actual := l^.sig;

    // Recorremos mientras no lleguemos al final y el codigo sea mayor
    while (actual <> nil) and (p.codigo > actual^.info.codigo) do
    begin
      anterior := actual;
      actual := actual^.sig;
    end;

    nuevo^.sig := actual;
    anterior^.sig := nuevo;
  end;
end;

{INCISO A 
* parametros: vector
* objetivo: almacenar en un vector(agrupados por rubros) los productos, 
            cada posicion del vector contiene una lista de productos ordenados 
            por codigo de producto. 
  corte de control= precio = -1 }
  
procedure cargarvector(var v:vector);
var
    p:producto;
begin
    leerProducto(p);
    while (p.precio <> -1)do begin 
        insertarOrdenado(v[p.codigo_rubro],p);
        leerProducto(p);
    end;
end;

{------------------------------------------------------------------------------}

procedure imprimirlista (l:lista_productos);
begin
    if (l = nil)then
        writeln('La lista se encuentra vacia')
    else
    while (l <> nil) do begin
        writeln('Codigo del producto: ',l^.info.codigo);
        writeln('Precio del producto: ',l^.info.precio:2:2);
        l:= l^.sig;
    end;
end;

{ INCISO B 
* parametros: vector
* objetivo: imprimir los productos de cada rubro }

procedure imprimir (v:vector); // INCISO B 
var
    i:integer;
begin
    for i:= 1 to maxrubro do begin 
        writeln('Datos del rubro: ',i);
        imprimirlista(v[i]);
        writeln('--------------------------------------------------');
    end;
end;

{-------------------------------------------------------------------------------}
{ INCISO C: 
* parametros: vector original, nuevo vector de rubro 3 y su diml 
* objetivo: cargar un vector(a lo sumo 20 elementos) con los productos
 			del rubro 3
 
  si cant productos > 20, almacenamos los primeros 20.
* }

procedure cargarRubro3(v: vector; var v3: rubro3; var diml: integer);
var
  i: integer;
  aux: lista_productos;
begin
  i := 0;
  aux := v[3]; // Usamos puntero auxiliar para no modificar la lista original

  while (aux <> nil) and (i <= 20) do begin
    i := i + 1;
    v3[i] := aux^.info; // Copiamos el producto al vector
    aux := aux^.sig;
  end;
  
end;

{------------------------------------------------------------------------------}
{INCISO D:
* parametros: vector del rubro 3, su diml
* objetivo: ordenar por precio los elementos del vector}

procedure selecion (var v : rubro3; diml : integer); // INCISO D 
var
	i, j, pos : integer;
	item : producto;
begin
	for i := 1 to diml - 1 do
		begin
			pos := i;
			for j := i + 1 to diml do
				if (v[j].precio < v[pos].precio) then
					pos := j;
			item := v[pos];
			v[pos] := v[i];
			v[i] := item;
		end;
end;


{-----------------------------------------------------------------------------}
{INCISO E:
* parametros: vector del rubro 3, su diml
* objetivo: imprimir en pantalla su contenido  }

procedure imprimir2 (v:rubro3;diml:integer); // INCISO E 
var
    i:integer;
begin
    writeln('1eros 20 productos guardados del rubro 3: ');
    for i:= 1 to diml do begin 
        writeln('Producto nro: ',i);
        writeln('Codigo: ',v[i].codigo);
        writeln('Precio: ',v[i].precio:2:2);
        writeln();
    end;
end;

{-----------------------------------------------------------------------------}
{INCISO F: 
* parametros: vector rubro 3, su diml
* objetivo: calcular promedio de precios del vector }


function prom (v:rubro3; diml:integer):real;
var
    suma:real;
    i:integer;
begin
    suma:= 0;
    for i:= 1 to diml do 
        suma:= suma + v[i].precio;
    prom:= suma / diml;
end;

{----------------------------------------------------------------------------}

var
    v:vector; v3:rubro3; diml:integer;
begin
    randomize;
    diml:= 0; 
    inicializar(v);
    cargarvector(v); //INCISO A 
    imprimir(v); // INCISO B 
    cargarrubro3(v,v3,diml); //INCISO C 
    selecion(v3,diml); //INCISO D 
    imprimir2(v3,diml); //INCISO E 
    writeln('el promedio de los precios de productos del rubro 3 es: ',prom(v3,diml):2:2); // INCISO F 
end.
