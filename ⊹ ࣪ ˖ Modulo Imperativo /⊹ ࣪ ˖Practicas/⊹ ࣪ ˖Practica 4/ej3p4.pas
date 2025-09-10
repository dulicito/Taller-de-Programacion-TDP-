{3. Implementar un programa modularizado para una librería. Implementar módulos para:

a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados su código, la
cantidad total de unidades vendidas y el monto total. De cada venta se lee código de
venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. El
ingreso de las ventas finaliza cuando se lee el código de venta -1.

b. Imprimir el contenido del árbol ordenado por código de producto.

c. Retornar el código de producto con mayor cantidad de unidades vendidas.

d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
que se recibe como parámetro.

e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
valores recibidos (sin incluir) como parámetros.}

{hacer dsp}

program ej3p3;
const
    corte= -1;
type
    producto=record
        codigo:integer;
        total_vendidas: integer;
        monto_total: real;
    end;
    
    venta: record
        cod_venta: integer;
        cod_vendido:integer;
        cant_vendidos:integer;
        precio_unitario:integer;
    end;
    
    arbol= ^nodo;
        nodo=record
            info: producto;
            hi: arbol;
            hd: arbol;
        end;
{-----------------------------------------------------------------------------}

{a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados su código, la
cantidad total de unidades vendidas y el monto total. De cada venta se lee código de
venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. El
ingreso de las ventas finaliza cuando se lee el código de venta -1.}    



procedure leerVenta(var v:venta);
begin
   v.cod_venta:= random (1000);
   if (v.cod_venta <> corte)then begin 
        v.cod_vendido:= random(1000);
        v.cant_vendidos:= random(1000);
        v.precio_unitario:= random(1000);
    end;
end;


procedure agregarNodoOrdenado(var a:arbol; v:venta);
var
    aux:a;
begin
    if (l = nil)then begin
        new(aux);
        aux^.info.codigo:= v.cod_vendido;
        aux^.info.total_vendidas:= v.cant_vendidos;
        aux^.info.monto_total:= v.monto_total;
        aux^.hi:= nil;
        aux^.hd:= nil;
        a:= aux;
    else
        if (a^.info.codigo<= v.cod_vendido)then agregarNodoOrdenado(a^.hi,v);
        else agregarNodoOrdenado(a^hd,v);
    end;
end;


procedure cargarProductosVendidos (var a:arbol);
var
    v:venta; 
begin
    leerVenta(v);
    while (v.cod_venta <> corte)do begin 
        agregarNodoOrdenado (a, v);
        leerVenta(v);
    end;
end;


{-----------------------------------------------------------------------------}

{b. Imprimir el contenido del árbol ordenado por código de producto.}

{-----------------------------------------------------------------------------}


{c. Retornar el código de producto con mayor cantidad de unidades vendidas.} 


{-----------------------------------------------------------------------------}


{d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
que se recibe como parámetro.}

{-----------------------------------------------------------------------------}

{e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
valores recibidos (sin incluir) como parámetros.}


{----------------------------------------------------------------------------}

var
    a:arbol; num,num1,num2:integer;
begin 
    a:= nil; 
    randomize;//inicializo para numeros randoms
    cargarProductosVendidos(a); // INCISO A 
    imprimir(a); //INCISO B 
    writeln('El codigo con mayor cantidad de unidades vendidas fue: ',codigomaxcant(a)); //INCISO C
    writeln('Ingrese un valor: '); readln(num);
    writeln('La cantidad de codigos que son menores a ',num,', son: ',cantvalor(a,num)); //INCISO D 
    Writeln('Ingrese un numero, el sera el principio del rango a buscar:'); readln(num1);
    Writeln('Ahora ingrese el final del rango: '); readln(num2);
    Writeln('El monto total que se encuentra en el rango ingresado es de: ',total(a,num1,num2)); // INCISO E 
end.
