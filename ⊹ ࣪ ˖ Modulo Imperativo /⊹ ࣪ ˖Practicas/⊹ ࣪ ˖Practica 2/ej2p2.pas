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

{aun no terminado xd}

program ej2p2;
type

    lista= ^nodo
        nodo=record
            info:integer;
            sig:lista;
        end;
        
{------------------------------------------------------------------------------}
{A. Implemente un módulo recursivo que genere y retorne una lista de números enteros
“random” en el rango 100-200. Finalizar con el número 100.}

procedure generarlista (var l:lista);
var 
    num:integer
begin
    num:= random(101) + 100;
    if (num <> 100)do begin 
        l^.info:= num;
        generarlista(l^.sig);
    end;
end;

{------------------------------------------------------------------------------}
{b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de 
la lista en el mismo orden que están almacenados.}

procedure imprimir(l:lista;)

var
    l:lista; boolean:boolean; valor:integer;
begin
    randomize;
    l:= nil; boolean:= false;
    generarlista(l); // INCISO A 
    imprimir(l); // INCISO B
    imprimirinverso(l); // INCISO C 
    writeln('El valor minimo de la lista es: ',min(l)); //INCISO D 
    writeln('Ingrese el valor para buscar en la lista: ');
    readln(valor);
    seencontro(l,valor,boolean); //INCISO E 
end;
