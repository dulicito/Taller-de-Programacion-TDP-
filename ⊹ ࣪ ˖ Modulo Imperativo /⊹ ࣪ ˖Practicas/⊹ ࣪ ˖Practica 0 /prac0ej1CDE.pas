{c) Modifique el programa para que imprima 20 números
aleatorios.
d) Modifique el programa para que imprima N números
aleatorios en el rango (A,B), donde N, A y B son
números enteros que se leen por teclado.
e) Modifique el programa para que imprima números
aleatorios en el rango (A,B) hasta que se genere un
valor igual a F, el cual no debe imprimirse. F, A y B
son números enteros que se leen por teclado.}

Program prac0ej1c;
Var 
    ale,i: integer;
Begin
  randomize;
  For i:= 1 To 20 Do
    Begin
      ale := random (100);
      writeln ('El numero aleatorio generado es: ', ale);
    End;
  readln;
End.



Program prac0ej1d;
Var 
    ale: integer;
    n,a,b,i: integer;
Begin
  randomize;
  readln(n);//cant numeros aleatorios 
  readln(a);//limite inferior
  readln(b);//limite superior 
  For i:= 1 To n Do
    Begin
      ale := random (B - A + 1)+ A;
      writeln ('El numero aleatorio generado es: ', ale);
    End;
  readln;
End.


Program prac0ej1e;
Var 
    ale, a,b,f: integer;
Begin
  randomize;
  readln(a);//limite inferior  
  readln(b);//limite superior
  readln(f);//valor a encontrar 
  Repeat
    ale := random(b - a + 1)+ a;
    If ale <> f Then
      writeln('El numero aleatorio generado es: ',ale);
  Until ale = f;
  readln;
End.