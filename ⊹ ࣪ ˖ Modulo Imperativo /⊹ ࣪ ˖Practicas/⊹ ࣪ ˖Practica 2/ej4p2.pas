{4.- Implementar un programa que invoque a los siguientes módulos.

a. Un módulo recursivo que retorne un vector de 30 números enteros 
“random” mayores a 300 y menores a 550 (incluidos ambos).

b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. 
(Utilizar lo realizado en la práctica anterior)

c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando 
el siguiente encabezado:
A
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.}

program ej3p2;
const 
	maxrango= 30;
type
	rango= 1..maxrango;
	vector=array[rango]of integer;
	
{----------------------------------------------------------------------}
{INCISO A:
  OBJETIVO:
  Cargar recursivamente un vector con números enteros random
  entre 300 y 550, incluyendo ambos valores.

  PARAMETROS:
  v: vector donde se almacenan los números.
  cant: cantidad de elementos cargados.
}

procedure cargarvector(var v:vector; cant:integer);
var
	num:integer;
begin
	if (cant <= maxrango)then begin
		cant:= cant + 1;
		num:= random(550-300+1)+300; {preguntar por las dudas despues}
		v[cant]:= num;
		cargarvector(v,cant);
	end;
end;

{----------------------------------------------------------------------}

{ INCISO B:
* OBJETIVO:
  Ordenar los elementos del vector de menor a mayor
  utilizando el método de selección.

  PARAMETRO:
  v: vector que se desea ordenar. }

procedure ordenarvector(var v: vector);
var
  i, j, posmin, aux: integer;
begin
  for i := 1 to maxrango - 1 do begin
    posmin := i;

    for j := i + 1 to maxrango do begin
      if (v[j] < v[posmin]) then
        posmin := j;
    end;

    aux := v[i];
    v[i] := v[posmin];
    v[posmin] := aux;
  end;
end;



{----------------------------------------------------------------------}

{ INCISO C:
  OBJETIVO:
  Buscar recursivamente un dato en un vector ordenado
  mediante el método de búsqueda dicotómica.

  busca un valor dentro de un vector ordenado, dividiendo 
  el espacio de búsqueda en dos partes en cada paso.

  PARAMETROS:
  v: vector ordenado donde se realiza la búsqueda.
  ini: posición inicial del rango de búsqueda.
  fin: posición final del rango de búsqueda.
  dato: valor que se desea buscar.
  pos: posición donde se encuentra el dato o -1 si no se encuentra. }

procedure busquedaDicotomica(v: vector; ini, fin: integer; dato: integer; var pos: integer);
var
  medio: integer;
begin
  if (ini > fin) then
    pos := -1
  else
  begin
    medio := (ini + fin) div 2;
    if (v[medio] = dato) then
      pos := medio
    else if (dato < v[medio]) then
      busquedaDicotomica(v, ini, medio - 1, dato, pos)
    else
      busquedaDicotomica(v, medio + 1, fin, dato, pos);
  end;
end;



var
	v:vector;cant:integer; ini,fin,dato,pos:integer;
begin
	randomize;
	cant:= 0;
	pos:= -1;
	ini:= 1; fin:= maxrango;
	cargarvector(v,cant); // INCISO A
	ordenarvector(v); // INCISO B 
	writeln('Ingrese un numero para buscar');
	readln(dato);
	busquedaDicotomica(v,ini,fin,dato,pos); // INCISO C
	if pos <> -1 then
		writeln('El valor ', dato, ' se encuentra en la posicion: ', pos)
	else
		writeln('El valor ', dato, ' NO esta en el vector.');
end.
