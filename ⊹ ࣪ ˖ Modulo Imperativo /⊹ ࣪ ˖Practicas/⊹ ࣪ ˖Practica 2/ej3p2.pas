
{3.- Escribir un programa que invoque a los siguientes módulos e informe 
el resultado:

a. Un módulo recursivo que retorne un vector de a lo sumo 20 caracteres 
que conformen una palabra. La lectura de los caracteres termina en ‘.’

b. Un módulo recursivo que reciba la “palabra” generada en a) y determine 
si dicha palabra es un palíndromo, es decir, si puede leerse de la misma 
manera de izquierda a derecha que de derecha a izquierda. Este módulo 
debe retornar el valor booleano correspondiente.}

program ej3p3;

const
  maxrango = 20;

type
  rango = 1..maxrango;
  vector = array[rango] of char;

{-------------------------------------------------------------}
{ INCISO A:
  Genera recursivamente un vector de hasta 20 caracteres.
  La lectura termina cuando se ingresa '.'
}

procedure cargarvector(var v: vector; var cant: integer);
var
  caracter: char;
begin
  if (cant < maxrango) then begin
    readln(caracter);

    if (caracter <> '.') then begin
      cant := cant + 1;
      v[cant] := caracter;
      cargarvector(v, cant);
    end;
  end;
end;

{-------------------------------------------------------------}
{ INCISO B:
  Determina recursivamente si la palabra es un palindromo.
}

function esPalindromo(v: vector; ini, fin: integer): boolean;
begin
  if (ini >= fin) then
    esPalindromo := true
  else if (v[ini] <> v[fin]) then
    esPalindromo := false
  else
    esPalindromo := esPalindromo(v, ini + 1, fin - 1);
end;

{-------------------------------------------------------------}

var
  v: vector;
  cant: integer;
  resultado: boolean;

begin
  cant := 0;

  writeln('Ingrese una palabra caracter por caracter.');
  writeln('Finalice con "."');

  cargarvector(v, cant);

  resultado := esPalindromo(v, 1, cant);

  if (resultado) then
    writeln('La palabra es un palindromo.')
  else
    writeln('La palabra NO es un palindromo.');
end.

