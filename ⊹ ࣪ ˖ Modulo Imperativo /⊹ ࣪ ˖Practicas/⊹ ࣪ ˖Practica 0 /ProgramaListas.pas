{ACTIVIDAD 3: Crear un archivo ProgramaListas.pas

a) Implemente un módulo CargarLista que cree una lista de enteros y le
agregue valores aleatorios entre el 100 y 150, hasta que se genere el
120.

b) Implemente un módulo ImprimirLista que reciba una lista generada en
a) e imprima todos los valores de la lista en el mismo orden que están
almacenados.

c) Implemente un módulo BuscarElemento que reciba la lista generada
en a) y un valor entero y retorne true si el valor se encuentra en la lista
y false en caso contrario.

d) Invocar desde el programa principal a los módulos implementados
para crear una lista, mostrar todos sus elementos y determinar si un
valor leído por teclado se encuentra o no en la lista.}


Program ProgramaListas;

Type 
  Lista = ^Nodo;
  Nodo = Record
    dato: integer;
    sig: Lista;
  End;

Procedure CargarNodo(Var L: Lista; num: integer);
Var 
  nue: Lista;
Begin
  new(nue);
  nue^.dato := num;
  nue^.sig := L;
  L := nue;
End;

Procedure CargarLista(Var L: Lista);
Var 
  num: integer;
Begin
  randomize;
  L := Nil;
  Repeat
    num := random(51) + 100;// genera entre 100 y 150
    If num <> 120 Then
      CargarNodo(L, num);
  Until num = 120;
End;

Procedure ImprimirLista(L: Lista);
Begin
  writeln('Elementos de la lista:');
  While L <> Nil Do
    Begin
      writeln(L^.dato);
      L := L^.sig;
    End;
End;

Function BuscarElemento(L: Lista; valor: integer): boolean;
Var 
  ok: boolean;
Begin
  ok := false;
  While L <> Nil Do
    Begin
      If L^.dato = valor Then
        ok := true;
      L := L^.sig;
    End;
  BuscarElemento := ok;
End;

Var 
  L: Lista;
  buscado: integer;
Begin
  CargarLista(L);
  ImprimirLista(L);
  writeln('Ingrese un valor a buscar en la lista:');
  readln(buscado);
  If BuscarElemento(L, buscado) Then
    writeln('El valor ', buscado, ' se encuentra en la lista.')
  Else
    writeln('El valor ', buscado, ' no se encuentra en la lista.');
  readln;
End.
