{ 2.- Escribir un programa que:

a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
“random” en el rango 100-200. Finalizar con el número 100.

b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de 
la lista en el mismo orden que están almacenados.

c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los 
valores de la lista en orden inverso al que están almacenados.

d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el 
mínimo valor de la lista.

e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y 
devuelva verdadero si dicho valor se encuentra en la lista o falso en caso contrario.}


program ej2p2;
type

    lista= ^nodo;
        nodo=record
            info:integer;
            sig:lista;
        end;
        
{------------------------------------------------------------------------------}
{A. Implemente un módulo recursivo que genere y retorne una lista de números enteros
“random” en el rango 100-200. Finalizar con el número 100.}

procedure generarlista(var l: lista);
var
  num: integer;
begin
  num := random(101) + 100;   { genera entre 100 y 200 }
  if (num <> 100) then
  begin
    new(l);
    l^.info := num;
    generarlista(l^.sig);     { sigue generando }
  end
  else
    l := nil;                 { corte de la lista }
end;

{------------------------------------------------------------------------------}
{b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de 
la lista en el mismo orden que están almacenados.}

procedure imprimir(l:lista);
begin
	if (l<>nil)then begin
		writeln('El valor a imprimir es: ',l^.info);
		imprimir(l^.sig);
	end;
end;

{------------------------------------------------------------------------------}
{c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los 
valores de la lista en orden inverso al que están almacenados.}

{anotacion: el imprimirinverso es distinto que el realizado en el 
inciso B, lamentablemente ambos son distintos, sino se reutilizaria :c}

procedure imprimirinverso(l: lista); // INCISO C 
begin
  if (l <> nil) then begin
    imprimirinverso(l^.sig); { primero baja al final }
    writeln(L^.info);             { imprime al volver }
  end;
end;

{-------------------------------------------------------------------------------}
{d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el 
mínimo valor de la lista.}

function minimo(l: lista; min: integer): integer;
begin
  if (l = nil) then
    minimo := min
  else
  begin
    if (l^.info < min) then
      min := l^.info;
    minimo := minimo(l^.sig, min);
  end;
end;


{-------------------------------------------------------------------------------}
{e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y 
devuelva verdadero si dicho valor se encuentra en la lista o falso en caso contrario.}

function seencontro(l: lista; valor: integer): boolean;
begin
  if (l = nil) then
    seencontro := false
  else if (l^.info = valor) then
    seencontro := true
  else
    seencontro := seencontro(l^.sig, valor);
end;



var
    l:lista; valor:integer; min:integer;
begin
    randomize;
    l:= nil; min:=9999;
    generarlista(l); // INCISO A 
    imprimir(l); // INCISO B
    imprimirinverso(l); // INCISO C 
    writeln('El valor minimo de la lista es: ',minimo(l,min)); //INCISO D 
    writeln('Ingrese el valor para buscar en la lista: ');
    readln(valor);
    writeln('se encontro el valor ingresado en la lista: ',seencontro(l,valor)); //INCISO E 
end.
