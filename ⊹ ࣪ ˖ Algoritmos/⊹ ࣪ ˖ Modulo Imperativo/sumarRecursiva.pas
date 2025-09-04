{funcion que lee un valor n e imprima la suma de los n primeros numeros naturales, basicamente factorial de n xd }
function sumarRecursiva(n:integer):integer;
var  aux:integer;
begin
  if (n > 1)then
    aux:= n + sumarRecursiva(n - 1);
  else
    aux:= 1;
  sumarRecursiva:= aux;
end;
