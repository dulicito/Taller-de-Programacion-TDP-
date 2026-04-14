{2. Descargar el programa ImperativoEjercicioClase3.pas de la 
clase anterior e incorporar lo necesario para:


i. Informar el número de socio más grande. Debe invocar a un módulo 
recursivo que retorne dicho valor.

ii. Informar los datos del socio con el número de socio mas chico. 
Debe invocar a un módulo recursivo que retorne dicho socio.

iii. Leer un valor entero e informar si existe o no existe un socio 
con ese valor. Debe invocar a un módulo recursivo que reciba el valor 
leído y retornar verdadero o falso.

iv. Leer dos valores e informar la cantidad de socios cuyos códigos se encuentran
comprendidos entre los valores leídos. Debe invocar a un módulo recursivo que reciba
los valores leídos y retorne la cantidad solicitada.}



program ej2p4;

type
  rangoEdad = 12..100;
  cadena15 = string[15];

  socio = record
    numero: integer;
    nombre: cadena15;
    edad: rangoEdad;
  end;

  arbol = ^nodoArbol;
  nodoArbol = record
    dato: socio;
    HI, HD: arbol;
  end;


//genera arbol.
procedure GenerarArbol(var a: arbol);

  procedure CargarSocio(var s: socio);
  var vNombres: array[0..9] of string =
    ('Ana','Jose','Luis','Ema','Ariel','Pedro','Lena','Lisa','Martin','Lola');
  begin
    s.numero := random(51) * 100;
    if (s.numero <> 0) then begin
      s.nombre := vNombres[random(10)];
      s.edad := 12 + random(79);
    end;
  end;

  procedure InsertarElemento(var a: arbol; elem: socio);
  begin
    if (a = nil) then begin
      new(a);
      a^.dato := elem;
      a^.HI := nil;
      a^.HD := nil;
    end
    else if (elem.numero < a^.dato.numero) then
      InsertarElemento(a^.HI, elem)
    else
      InsertarElemento(a^.HD, elem);
  end;

var s: socio;
begin
  a := nil;
  CargarSocio(s);
  while (s.numero <> 0) do begin
    InsertarElemento(a, s);
    CargarSocio(s);
  end;
end;


procedure InformarSociosOrdenCreciente(a: arbol);
begin
  if (a <> nil) then begin
    InformarSociosOrdenCreciente(a^.HI);
    writeln(a^.dato.numero, ' ', a^.dato.nombre, ' ', a^.dato.edad);
    InformarSociosOrdenCreciente(a^.HD);
  end;
end;


procedure InformarSociosOrdenDecreciente(a: arbol);
begin
  if (a <> nil) then begin
    InformarSociosOrdenDecreciente(a^.HD);
    writeln(a^.dato.numero, ' ', a^.dato.nombre, ' ', a^.dato.edad);
    InformarSociosOrdenDecreciente(a^.HI);
  end;
end;


//inciso i.
function Maximo(a: arbol): integer;
begin
  if (a = nil) then
    Maximo := -1
  else if (a^.HD = nil) then
    Maximo := a^.dato.numero
  else
    Maximo := Maximo(a^.HD);
end;


//inciso ii.
function Minimo(a: arbol): socio;
begin
  if (a^.HI = nil) then
    Minimo := a^.dato
  else
    Minimo := Minimo(a^.HI);
end;



//inciso iii.
function Existe(a: arbol; num: integer): boolean;
begin
  if (a = nil) then
    Existe := false
  else if (a^.dato.numero = num) then
    Existe := true
  else if (num < a^.dato.numero) then
    Existe := Existe(a^.HI, num)
  else
    Existe := Existe(a^.HD, num);
end;



//inciso iv.
function ContarEntre(a: arbol; v1, v2: integer): integer;
begin
  if (a = nil) then
    ContarEntre := 0
  else if (a^.dato.numero > v1) and (a^.dato.numero < v2) then
    ContarEntre := 1 +
                   ContarEntre(a^.HI, v1, v2) +
                   ContarEntre(a^.HD, v1, v2)
  else if (a^.dato.numero <= v1) then
    ContarEntre := ContarEntre(a^.HD, v1, v2)
  else
    ContarEntre := ContarEntre(a^.HI, v1, v2);
end;



//prog. principal


var
  a: arbol;
  num, v1, v2: integer;
  s: socio;

begin
  randomize;

  GenerarArbol(a);

  writeln('--- ORDEN CRECIENTE ---');
  InformarSociosOrdenCreciente(a);
  writeln;
  writeln;
  writeln('--- ORDEN DECRECIENTE ---');
  InformarSociosOrdenDecreciente(a);

  writeln('Numero del socio mas grande: ', Maximo(a)); //inciso i.

  if (a <> nil) then begin
    s := Minimo(a);
    writeln('Socio mas chico: ', s.numero, ' ', s.nombre, ' ', s.edad); // inciso ii.
  end;

  writeln('Ingrese un numero para buscar: ');
  readln(num);
  if (Existe(a, num)) then  // inciso iii.
    writeln('Existe')
  else
    writeln('No existe');

  writeln('Ingrese el inicio del rango: ');
  readln(v1);
  writeln('Ingrese el final del rango: ');
  readln(v2);
  writeln('Cantidad entre valores: ', ContarEntre(a, v1, v2)); // inciso iv.

end.
