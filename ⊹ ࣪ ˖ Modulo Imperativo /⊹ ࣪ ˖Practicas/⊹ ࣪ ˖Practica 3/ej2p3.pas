{2. Escribir un programa que:

a. Implemente un módulo que genere aleatoriamente información de ventas 
de un comercio.Para cada venta generar código de producto, fecha y cantidad 
de unidades vendidas. Finalizar con el código de producto 0. Un producto puede 
estar en más de una venta. Se pide:


i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código 
de producto. Los códigos repetidos van a la derecha.


ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos 
ordenado por código de producto. Cada nodo del árbol debe contener el código de 
producto y la cantidad total de unidades vendidas.


iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado 
por código de producto. Cada nodo del árbol debe contener el código de producto y la 
lista de las ventas realizadas del producto.
Nota: El módulo debe retornar TRES árboles.


b. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne 
la cantidad total de productos vendidos en la fecha recibida.


c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de 
producto con mayor cantidad total de unidades vendidas.


d. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto
con mayor cantidad de ventas}

program ej2p3;

type
  venta = record
    cod: integer;
    fecha: integer;
    cant: integer;
  end;

  // LISTA 
  lista = ^nodoLista;
  nodoLista = record
    dato: venta;
    sig: lista;
  end;

  // ARBOL i 
  arbol1 = ^nodo1;
  nodo1 = record
    dato: venta;
    HI, HD: arbol1;
  end;

  // ARBOL ii 
  info2 = record
    cod: integer;
    total: integer;
  end;

  arbol2 = ^nodo2;
  nodo2 = record
    dato: info2;
    HI, HD: arbol2;
  end;

  //  ARBOL iii 
  info3 = record
    cod: integer;
    ventas: lista;
  end;

  arbol3 = ^nodo3;
  nodo3 = record
    dato: info3;
    HI, HD: arbol3;
  end;

// generador de ventas

procedure CargarVenta(var v: venta);
begin
  v.cod := random(100); //  corta en 0
  if (v.cod <> 0) then begin
    v.fecha := random(30) + 1;
    v.cant := random(20) + 1;
  end;
end;



// arbol i.
{
    genera y retorna abb ordenado por codigo de producto
    productos repetidos van a la derecha 
}

procedure Insertar1(var a: arbol1; v: venta);
begin
  if (a = nil) then begin
    new(a);
    a^.dato := v;
    a^.HI := nil;
    a^.HD := nil;
  end
  else if (v.cod < a^.dato.cod) then
    Insertar1(a^.HI, v)
  else
    Insertar1(a^.HD, v);
end;


// arbol ii.
{
    genera y retorna abb ordenado por codigo de producto 
        cada nodo contiene:
            codigo producto, cant total de unidades vendidas
}
procedure Insertar2(var a: arbol2; v: venta);
begin
  if (a = nil) then begin
    new(a);
    a^.dato.cod := v.cod;
    a^.dato.total := v.cant;
    a^.HI := nil;
    a^.HD := nil;
  end
  else if (v.cod = a^.dato.cod) then
    a^.dato.total := a^.dato.total + v.cant
  else if (v.cod < a^.dato.cod) then
    Insertar2(a^.HI, v)
  else
    Insertar2(a^.HD, v);
end;



// arbol iii.
{
    generar y retornar abb ordenado por codigo de producto
    cada nodo guarda:
        codigo del producto y lista de las ventas realizadas del producto 
}
procedure AgregarLista(var l: lista; v: venta);
var nue: lista;
begin
  new(nue);
  nue^.dato := v;
  nue^.sig := l;
  l := nue;
end;

procedure Insertar3(var a: arbol3; v: venta);
begin
  if (a = nil) then begin
    new(a);
    a^.dato.cod := v.cod;
    a^.dato.ventas := nil;
    AgregarLista(a^.dato.ventas, v);
    a^.HI := nil;
    a^.HD := nil;
  end
  else if (v.cod = a^.dato.cod) then
    AgregarLista(a^.dato.ventas, v)
  else if (v.cod < a^.dato.cod) then
    Insertar3(a^.HI, v)
  else
    Insertar3(a^.HD, v);
end;


{INCISO A:
    genera aleatoriamente ventas
    guarda las ventas segun el el tipo de condicion que pone cada arbol1
    
    corte de control: codigo producto = 0 } 


procedure Generar(var a1: arbol1; var a2: arbol2; var a3: arbol3);
var v: venta;
begin
  a1 := nil; a2 := nil; a3 := nil;

  CargarVenta(v);
  while (v.cod <> 0) do begin
    Insertar1(a1, v);
    Insertar2(a2, v);
    Insertar3(a3, v);
    CargarVenta(v);
  end;
end;



{INCISO B: 
    parametros: arbol i, fecha 
    retorna: cant total de productos vendidos en esa fecha 
}
function TotalFecha(a: arbol1; f: integer): integer;
begin
  if (a = nil) then
    TotalFecha := 0
  else begin
    TotalFecha := TotalFecha(a^.HI, f) + TotalFecha(a^.HD, f);
    if (a^.dato.fecha = f) then
      TotalFecha := TotalFecha + a^.dato.cant;
  end;
end;



{INCISO C: 
    parametros: arbol ii, maxcod, maxCant
    retornar: codigo del producto con mayor cantidad total de unidades vendidas
} 
procedure MaxUnidades(a: arbol2; var maxCod, maxCant: integer);
begin
  if (a <> nil) then begin
    if (a^.dato.total > maxCant) then begin
      maxCant := a^.dato.total;
      maxCod := a^.dato.cod;
    end;
    MaxUnidades(a^.HI, maxCod, maxCant);
    MaxUnidades(a^.HD, maxCod, maxCant);
  end;
end;



{INCISO D: 
    parametros: arbol iii, maxcod, maxv
    retorna: codigo del producto con mayor cantidad de ventas 
}
function ContarLista(l: lista): integer;
begin
  if (l = nil) then
    ContarLista := 0
  else
    ContarLista := 1 + ContarLista(l^.sig);
end;

procedure MaxVentas(a: arbol3; var maxCod, maxV: integer);
var cant: integer;
begin
  if (a <> nil) then begin
    cant := ContarLista(a^.dato.ventas);
    if (cant > maxV) then begin
      maxV := cant;
      maxCod := a^.dato.cod;
    end;
    MaxVentas(a^.HI, maxCod, maxV);
    MaxVentas(a^.HD, maxCod, maxV);
  end;
end;



{programa principal}

var
  a1: arbol1;
  a2: arbol2;
  a3: arbol3;
  fecha: integer;
  maxCod, maxCant: integer;
  maxCodV, maxV: integer;
      
begin
  randomize;

  Generar(a1, a2, a3); // inciso a 

  writeln('Ingrese fecha a consultar: ');
  readln(fecha);
  writeln('Total vendido en esa fecha: ', TotalFecha(a1, fecha)); // inciso b

  maxCant := -9999;
  MaxUnidades(a2, maxCod, maxCant);
  writeln('Producto con mas unidades vendidas: ', maxCod); // inciso c 

  maxV := -9999;
  MaxVentas(a3, maxCodV, maxV);
  writeln('Producto con mas ventas: ', maxCodV); // inciso d 
end.
