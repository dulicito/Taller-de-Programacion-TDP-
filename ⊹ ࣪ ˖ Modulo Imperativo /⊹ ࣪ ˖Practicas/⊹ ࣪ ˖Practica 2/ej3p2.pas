{3.- Implementar un programa que invoque a los siguientes módulos.

a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
y menores a 1550 (incluidos ambos).

b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado
en la práctica anterior)

c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente
encabezado:
A
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.}

program ej3p2;
const 
	maxrango= 20;
type
	rango= 1..maxrango;
	vector=array[rango]of integer;
	
{----------------------------------------------------------------------}
{a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
y menores a 1550 (incluidos ambos).}

procedure cargarvector(var v:vector; cant:integer);
var
	num:integer;
begin
	if (cant <= maxrango)then begin
		cant:= cant + 1;
		num:= random(1251)+300; {preguntar por las dudas despues}
		v[cant]:= num;
		cargarvector(v,cant+1);
	end;
end;

{----------------------------------------------------------------------}

{b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado
en la práctica anterior)}

procedure ordenarvector(var v: vector);
var
  i, j, actual: integer;
begin
  for i := 2 to maxrango do begin
    actual := v[i];
    j := i - 1;
    while (j > 0) and (v[j] > actual) do
    begin
      v[j + 1] := v[j];
      j := j - 1;
    end;
    v[j + 1] := actual;
  end;
end;



{----------------------------------------------------------------------}

{c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente
encabezado:

Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.}

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
