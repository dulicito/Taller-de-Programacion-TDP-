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



program ej3p3;
const
    corte= -1;
type
    producto=record
        codigo:integer;
        total_vendidas: integer;
        monto_total: real;
    end;
    
    venta= record
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
  v.cod_venta := random(1000);     
  v.cod_vendido := random(100);     
  v.cant_vendidos := 1 + random(10); 
  v.precio_unitario := 50 + random(451); 
end;



procedure agregarNodoOrdenado(var a: arbol; v: venta);
begin
  if a = nil then
  begin
    new(a);
    a^.info.codigo := v.cod_vendido;
    a^.info.total_vendidas := v.cant_vendidos;
    a^.info.monto_total := v.precio_unitario * v.cant_vendidos;
    a^.hi := nil;
    a^.hd := nil;
  end
  else if v.cod_vendido = a^.info.codigo then
  begin
    // actualizar totales si el producto ya existe
    a^.info.total_vendidas := a^.info.total_vendidas + v.cant_vendidos;
    a^.info.monto_total := a^.info.monto_total + (v.precio_unitario * v.cant_vendidos);
  end
  else if v.cod_vendido < a^.info.codigo then
    agregarNodoOrdenado(a^.hi, v)
  else
    agregarNodoOrdenado(a^.hd, v);
end;



procedure cargarProductosVendidos(var a: arbol);
var
  v: venta;
  i: integer;
begin
  for i := 1 to 10 do begin
    leerVenta(v);
    agregarNodoOrdenado(a, v);
  end;
end;



{-----------------------------------------------------------------------------}

{b. Imprimir el contenido del árbol ordenado por código de producto.}

procedure imprimir(a: arbol);
begin
  if (a <> nil) then begin
    imprimir(a^.hi);
    writeln('El codigo del producto es: ', a^.info.codigo);
    writeln('La cantidad de unidades vendidas fue: ', a^.info.total_vendidas);
    writeln('El monto total es: ', a^.info.monto_total:0:2);
    writeln('--------------------------------------------------------------');
    imprimir(a^.hd);
  end
end;


{-----------------------------------------------------------------------------}


{c. Retornar el código de producto con mayor cantidad de unidades vendidas.} 

procedure codigomaxcant(a:Arbol;var max:integer; var codmax:integer);
begin
    if (a <> nil)then begin 
        if (a^.info.total_vendidas >= max)then begin
            max:= a^.info.total_vendidas;
            codmax:= a^.info.codigo;
        end;
        codigomaxcant(a^.hi,max,codmax);
        codigomaxcant(a^.hd,max,codmax);
    end;
end;



{-----------------------------------------------------------------------------}

{d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
que se recibe como parámetro.} 

{PSEUCODIGO:
    recorro el arbol al lado izq de los menores
    si el num es menor que el valor 
        sumo + 1
    sino
        paso al siguiente nodo izq 
}
function codmin(a:arbol; num:integer):integer;
begin
    if (a = nil)then 
        codmin:= 0
    else if (a^.info.codigo < num)then codmin:= codmin(a^.hi,num)+codmin(a^.hd,num) + 1
        else codmin := codmin(a^.hi, num);

end;
{-----------------------------------------------------------------------------}

{e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
valores recibidos (sin incluir) como parámetros.}

{anotaciones para no marearme: TwT 
* tener en cuenta el caso base
* verificar si el nodo actual esta dentro del rango 
* si el nodo no esta dentro del rango paso al otro nodo }

function estaenelrango(cod:integer; num1,num2:integer):boolean;
begin
    if (cod >=num1 )and (cod <= num2)then 
        estaenelrango:= true
    else estaenelrango:= false; 
end;

function total(a:arbol; num1,num2:integer):real;
begin
    if (a = nil)then 
        total:= 0
    else 
        if (estaenelrango(a^.info.codigo,num1,num2))then 
            total:= total(a^.hi,num1,num2) + total(a^.hd,num1,num2) + a^.info.monto_total
        else if a^.info.codigo > num1 then total(a^.hi,num1,num2)
            else total(a^.hd,num1,num2);
end;
{----------------------------------------------------------------------------}

var
    a:arbol; num:integer;num1,num2:integer;max:integer; codmax:integer;
begin 
    a:= nil; 
    Randomize;//inicializo para numeros randoms
    cargarProductosVendidos(a); // INCISO A 
    if a = nil then
        writeln('El arbol esta vacio.')
    else
        imprimir(a); //INCISO B 
    max:= -9999; //INCISO C 
    codigomaxcant(a,max,codmax); //INCISO C
    writeln('El codigo del producto con mayor unidades vendidas es: ',codmax);//INCISO C 
    writeln('Ingrese un numero para buscar en el arbol los valores minimos a ese:'); // INCISO D 
    readln(num); //INCISO D 
    writeln('La cantidad de codigos que son menores a ',num,', son: ',codmin(a,num)); //INCISO D 
    Writeln('Ingrese un numero, sera el principio del rango a buscar:'); readln(num1);//INCISO E
    Writeln('Ahora ingrese el final del rango: '); readln(num2); //INCISO E
    Writeln('El monto total que se encuentra en el rango ingresado es de: ',total(a,num1,num2):0:2); // INCISO E 
end.
