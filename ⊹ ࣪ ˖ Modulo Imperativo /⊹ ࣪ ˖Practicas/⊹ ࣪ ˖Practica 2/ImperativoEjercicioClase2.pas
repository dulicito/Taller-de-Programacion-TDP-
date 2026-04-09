{1.- Implementar un programa que invoque a los siguientes modulos.

a. Un modulo recursivo que retorne un vector de a lo sumo 15 numeros enteros random mayores a 10 y menores a 155 (incluidos ambos). 
La carga finaliza con el valor 20.

b. Un modulo no recursivo que reciba el vector generado en a) e imprima el contenido del vector.

c. Un modulo recursivo que reciba el vector generado en a) e imprima el contenido del vector.

d. Un modulo recursivo que reciba el vector generado en a) y devuelva la suma de los valores pares contenidos en el vector.

e. Un modulo recursivo que reciba el vector generado en a) y devuelva el maximo valor del vector.

f. Un modulo recursivo que reciba el vector generado en a) y un valor y devuelva verdadero si dicho valor se encuentra en el 
vector o falso en caso contrario.

g. Un modulo que reciba el vector generado en a) e imprima, para cada numero contenido en el vector, sus digitos en el orden en
que aparecen en el numero. Debe implementarse un modulo recursivo que reciba el numero e imprima lo pedido. Ejemplo si se lee el
valor 142, se debe imprimir 1  4  2}

Program Clase2MI;
const dimF = 15;
      min = 10;
      max = 155;
type vector = array [1..dimF] of integer;
     

procedure CargarVector (var v: vector; var dimL: integer); // inciso A 

  procedure CargarVectorRecursivo (var v: vector; var dimL: integer);
  var valor: integer;
  begin
    valor:= min + random (max - min + 1);
    if ((valor <> 20 ) and (dimL < dimF)) 
    then begin
          dimL:= dimL + 1;
          v[dimL]:= valor;
          CargarVectorRecursivo (v, dimL);
         end;
  end;
  
begin
  dimL:= 0;
  CargarVectorRecursivo (v, dimL);
end;
 
procedure ImprimirVector (v: vector; dimL: integer); // inciso B 
var
   i: integer;
begin
     for i:= 1 to dimL do
         write ('----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        write(v[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('----');
     writeln;
     writeln;
End;     

{procedure ImprimirVectorRecursivo (v: vector; dimL: integer); // inciso C 

  procedure Recorrer (v: vector; pos, dimL: integer);
  begin
    if (pos <= dimL) then begin
      write(v[pos], ' | ');
      Recorrer(v, pos + 1, dimL);
    end;
  end;
begin
  write('Vector impreso de forma recursiva: ');
  Recorrer(v, 1, dimL);
  writeln;   
end;

    nota: otra forma de imprimirlo, mas simple
}

procedure ImprimirVectorRecursivo (v: vector; dimL: integer); // inciso C 

  procedure ImprimirLineas(pos, dimL: integer);
  begin
    if (pos <= dimL) then begin
      write('----');
      ImprimirLineas(pos + 1, dimL);
    end;
  end;

  procedure ImprimirElementos(v: vector; pos, dimL: integer);
  begin
    if (pos <= dimL) then begin
      write(v[pos], ' | ');
      ImprimirElementos(v, pos + 1, dimL);
    end;
  end;

begin
  writeln('Impresion del vector de forma Recursiva:');
  ImprimirLineas(1, dimL);
  writeln;

  write(' ');
  ImprimirElementos(v, 1, dimL);
  writeln;

  ImprimirLineas(1, dimL);
  writeln;
  writeln;
end;
    
function Sumar (v: vector; dimL: integer): integer; // inciso D 

  function SumarRecursivo (v: vector; pos, dimL: integer): integer;

  Begin
    if (pos <= dimL)  
    then SumarRecursivo:= SumarRecursivo (v, pos + 1, dimL) + v[pos]  
    else SumarRecursivo:=0  
  End;
 
var pos: integer; 
begin
 pos:= 1;
 Sumar:= SumarRecursivo (v, pos, dimL);
end;

function  ObtenerMaximo (v: vector; dimL: integer): integer; // inciso E 

  function MaxRec (v: vector; pos, dimL: integer): integer;
  var maxResto: integer;
  begin
    if (pos = dimL) then
      MaxRec := v[pos]
    else begin
      maxResto := MaxRec(v, pos + 1, dimL);
      if (v[pos] > maxResto) then
        MaxRec := v[pos]
      else
        MaxRec := maxResto;
    end;
  end;

begin
  ObtenerMaximo := MaxRec(v, 1, dimL);
end;     
     
function  BuscarValor (v: vector; dimL, valor: integer): boolean; // inciso F 

  function BuscarRec (v: vector; pos, dimL, valor: integer): boolean;
  begin
    if (pos > dimL) then
      BuscarRec := false
    else if (v[pos] = valor) then
      BuscarRec := true
    else
      BuscarRec := BuscarRec(v, pos + 1, dimL, valor);
  end;

begin
  BuscarValor := BuscarRec(v, 1, dimL, valor);
end; 


procedure ImprimirDigitos (v: vector; dimL: integer); // inciso G 

  procedure ImprimirDig (num: integer);
  begin
    if (num <> 0) then begin
      ImprimirDig(num div 10);
      write(num mod 10, ' ');
    end;
  end;

var i: integer;
begin
  for i := 1 to dimL do begin
    write('Numero ', v[i], ': ');
    if (v[i] = 0) then
      write('0')
    else
      ImprimirDig(v[i]);
    writeln;
  end;
end;


var dimL, suma, maximo, valor: integer; 
    v: vector;
    encontre: boolean;
Begin 
  CargarVector (v, dimL); // inciso A 
  writeln;
  if (dimL = 0) then writeln ('--- Vector sin elementos ---')
                else begin
                       ImprimirVector (v, dimL);// inciso B 
                       writeln;
                       writeln;
                       ImprimirVectorRecursivo (v, dimL); //inciso C 
                     end;
  writeln;
  writeln;                   
  suma:= Sumar(v, dimL); // inciso D 
  writeln;
  writeln;
  writeln('La suma de los valores del vector es ', suma); // inciso D
  writeln;
  writeln;
  maximo:= ObtenerMaximo(v, dimL); // inciso E 
  writeln;
  writeln;
  writeln('El maximo del vector es ', maximo); // inciso E
  writeln;
  writeln;
  write ('Ingrese un valor a buscar: ');
  read (valor);
  encontre:= BuscarValor(v, dimL, valor); // inciso F 
  writeln;
  writeln;
  if (encontre) then writeln('El ', valor, ' esta en el vector') // inciso F 
                else writeln('El ', valor, ' no esta en el vector'); // inciso F 
                
  writeln;
  writeln;
  ImprimirDigitos (v, dimL); // inciso G 
end.

