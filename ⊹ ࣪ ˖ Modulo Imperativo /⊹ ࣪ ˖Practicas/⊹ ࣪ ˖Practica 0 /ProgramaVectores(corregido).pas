{ACTIVIDAD 2: Crear un nuevo archivo ProgramaVectores.pas

a) Implemente un módulo CargarVector que cree un vector de enteros
con a lo sumo 50 valores aleatorios. Los valores, generados
aleatoriamente (entre un mínimo y máximo recibidos por parámetro),
deben ser almacenados en el vector en el mismo orden que se
generaron, hasta que se genere el valor máximo.

b) Implemente un módulo ImprimirVector que reciba el vector generado
en a) e imprima todos los valores de las posiciones pares del vector en
el mismo orden que están almacenados. ¿Qué cambiaría para imprimir
en orden inverso?

c) Escriba el cuerpo principal que invoque a los módulos ya
implementados.}

Program ProgramaVectores;

const
  max_numvec = 50;

Type
  vector = array[1..max_numvec] of integer;

Procedure CargarVector(Var v: vector; Var dimL: integer; min, max: integer); //inciso a 
Var
  num: integer;
Begin
  dimL := 0;

  Repeat
    num := random(max - min + 1) + min;
    If (dimL < max_numvec) Then Begin
      dimL := dimL + 1;
      v[dimL] := num;
    End;
  Until (num = max) Or (dimL = max_numvec);
  
End;


Procedure ImprimirVector(v: vector; dimL: integer); //inciso b 
Var
  i: integer;
Begin
  writeln('Valores de las posiciones pares:');

  For i := 2 To dimL Do
  Begin
    If (i Mod 2 = 0) Then
      writeln(v[i]);
  End;
End;


Procedure ImprimirVectorInverso(v: vector; dimL: integer);//inciso b 
Var
  i: integer;
Begin
  writeln('Valores de las posiciones pares en orden inverso:');

  For i := dimL Downto 2 Do
  Begin
    If (i Mod 2 = 0) Then
      writeln(v[i]);
  End;
End;


Var
  vec: vector;
  dimL, min, max: integer;

Begin
  Randomize;

  writeln('Ingrese el valor minimo del rango:');
  readln(min);

  writeln('Ingrese el valor maximo del rango:');
  readln(max);

  CargarVector(vec, dimL, min, max); //inciso a 

  writeln('-------------------------------');

  ImprimirVector(vec, dimL); //inciso b 

  writeln('-------------------------------');

  ImprimirVectorInverso(vec, dimL); //inciso b 
  
  readln;

End.
