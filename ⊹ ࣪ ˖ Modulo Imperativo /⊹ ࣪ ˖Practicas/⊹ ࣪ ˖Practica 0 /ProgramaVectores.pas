{ACTIVIDAD 2: Crear un nuevo archivo ProgramaVectores.pas

a) Implemente un módulo CargarVector que cree un vector de enteros
con a lo sumo 50 valores aleatorios. Los valores, generados
aleatoriamente (entre un mínimo y máximo recibidos por parámetro),
deben ser almacenados en el vector en el mismo orden que se
generaron, hasta que se genere el cero.

b) Implemente un módulo ImprimirVector que reciba el vector generago
en a) e imprima todos los valores del vector en el mismo orden que
están almacenados. Qué cambiaría para imprimir en orden inverso?

c) Escriba el cuerpo principal que invoque a los módulos ya
implementados.}

Program ProgramaVectores;

Const 
  max_numvec = 50;

Type 
  TVector = array[1..max_numvec] Of integer;

Procedure CargarVector(Var v: TVector; Var dimL: integer; min, max: integer);
Var 
  num: integer;
Begin
  randomize;//inicializo random para usarlo mas adelante 
  dimL := 0;
  Repeat
    num := random(max - min + 1) + min;
    If (num <> 0) And (dimL < max_numvec) Then
      Begin
        dimL := dimL + 1;
        v[dimL] := num;
      End;
  Until (num = 0) Or (dimL = max_numvec);
End;

Procedure ImprimirVector(v: TVector; dimL: integer);
Var 
  i: integer;
Begin
  writeln('Valores del vector:');
  For i := 1 To dimL Do
    writeln(v[i]);
End;

Procedure ImprimirVectorInverso(v: TVector; dimL: integer);
Var 
  i: integer;
Begin
  writeln('Valores del vector en orden inverso:');
  For i := dimL Downto 1 Do
    writeln(v[i]);
End;

Var 
  vec: TVector;
  dimL, min, max: integer;
Begin
  writeln('Ingrese el valor minimo:');
  readln(min);//limite inferior del rango 
  writeln('Ingrese el valor maximo:');
  readln(max);//limite superior del rango 
  CargarVector(vec, dimL, min, max);
  writeln('-------------------------------');//separador
  ImprimirVector(vec, dimL);
  writeln('-------------------------------');//separador
  ImprimirVectorInverso(vec, dimL);
  writeln('-------------------------------');//separador
  readln;
End.
