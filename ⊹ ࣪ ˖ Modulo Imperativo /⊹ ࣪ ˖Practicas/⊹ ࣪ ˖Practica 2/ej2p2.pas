{ 2.- Escribir un programa que:

a. Implemente un módulo recursivo que genere y retorne una lista de 
números enteros “random” en el rango 200-230. Finalizar con el número 200.

b. Un módulo recursivo que reciba la lista generada en a) e imprima los 
valores de la lista en el mismo orden que están almacenados.

c. Implemente un módulo recursivo que reciba la lista generada en a) e 
imprima los valores de la lista en orden inverso al que están almacenados.

d. Implemente un módulo recursivo que reciba la lista generada en a) y 
devuelva el mínimo valor de la lista.

e. Implemente un módulo recursivo que reciba la lista generada en a) y 
un valor y devuelva verdadero si dicho valor se encuentra en la lista o 
falso en caso contrario.}


program ej2p2;
type

    lista= ^nodo;
        nodo=record
            info:integer;
            sig:lista;
        end;
        
{------------------------------------------------------------------------------}

{ INCISO A: 
	objetivo: modulo recursivo que genera y retorna una lista
			  de numeros enteros random
			  *rango= 200-230
			  * corte de control: numero 200}

procedure generarlista(var l: lista);
var
  num: integer;
begin
  num := random(31) + 200;  
  if (num <> 200) then begin
    new(l);
    l^.info := num;
    generarlista(l^.sig);     
  end
  else
    l := nil;                 
end;

{------------------------------------------------------------------------------}
{ INCISO B: 
*  	recibo: lista
* 	pide imprimir los valores de la lista(recorrerlo)
	}

procedure imprimir(l:lista);
begin
	if (l<>nil)then begin
		writeln('El valor a imprimir es: ',l^.info);
		imprimir(l^.sig);
	end;
end;

{------------------------------------------------------------------------------}

{ INCISO C: 
* 	similar a INCISO B, solo pide imprimir al reves.
	}
procedure imprimirinverso(l: lista); // INCISO C 
begin
  if (l <> nil) then begin
    imprimirinverso(l^.sig); 
    writeln(L^.info);             
  end;
end;

{-------------------------------------------------------------------------------}

{ INCISO D: 
* 	recibo la lista 
* 	y devolver el minimo valor de la lista
	}
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

{ INCISO E: 
* 	recibo la lista y un valor
* 	retorno un boolean que muestra si el valor se encontro en la lista
	}
	
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
