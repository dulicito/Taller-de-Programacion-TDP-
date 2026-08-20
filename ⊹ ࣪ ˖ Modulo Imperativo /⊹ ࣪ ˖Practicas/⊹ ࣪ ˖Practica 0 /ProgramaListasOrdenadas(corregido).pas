{ACTIVIDAD 4: Crear un archivo ProgramaListasOrdenadas.pas

a) Implemente un módulo CargarListaOrdenada que cree una lista de
enteros y le agregue valores aleatorios entre el 100 y 150, hasta que se
genere el 120. Los valores dentro de la lista deben quedar ordenados
de menor a mayor.

b) Reutilice el módulo ImprimirLista que reciba una lista generada en a) e
imprima todos los valores de la lista en el mismo orden que están
almacenados.

c) Implemente un módulo BuscarElementoOrdenado que reciba la lista
generada en a) y un valor entero y retorne true si el valor se encuentra
en la lista y false en caso contrario.

d) Invocar desde el programa principal a los módulos implementados
para crear una lista ordenada, mostrar todos sus elementos y
determinar si un valor leído por teclado se encuentra o no en la lista.}


Program ProgramaListasOrdenadas;

Type 
  Lista = ^Nodo;
  Nodo = Record
    dato: integer;
    sig: Lista;
  End;


Procedure InsertarOrdenado(Var L: Lista; num: integer);
Var 
  nue, ant, act: Lista;
Begin
  new(nue);
  nue^.dato := num;
  nue^.sig := Nil;
  ant := Nil;
  act := L;
  While (act <> Nil) And (act^.dato < num) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If ant = Nil Then
    Begin
      nue^.sig := L;
      L := nue;
    End
  Else
    Begin
      nue^.sig := act;
      ant^.sig := nue;
    End;
End;



Procedure CargarListaOrdenada(Var L: Lista); //inciso a 
Var 
  num: integer;
Begin
  Repeat
    num := random(51) + 100;
    {If num <> 120 Then}
    InsertarOrdenado(L, num);
  Until num = 120;

End;


Procedure ImprimirLista(L: Lista); //inciso b 
Begin
  writeln('Elementos de la lista ordenada:');
  While L <> Nil Do Begin
      writeln(L^.dato);
      L := L^.sig;
  End;
End;

Function BuscarElementoOrdenado(L: Lista; valor: integer): boolean; //inciso c 
Begin
  While (L <> Nil) And (L^.dato < valor) Do
    L := L^.sig;
  If (L <> Nil) Then
    BuscarElementoOrdenado := true
  Else
    BuscarElementoOrdenado := false;
End;

Var 
  L: Lista;
  buscado: integer;
Begin
  Randomize;
  
  L:= nil;
  
  CargarListaOrdenada(L);//Inciso A
  
  ImprimirLista(L);//Inciso B 
  
  writeln('Ingrese un valor a buscar en la lista ordenada:');
  readln(buscado);
  
  If BuscarElementoOrdenado(L, buscado) Then //Inciso C 
    writeln('El valor ', buscado, ' se encuentra en la lista.')
  Else
    writeln('El valor ', buscado, ' NO se encuentra en la lista.');
  
  readln;
End.
