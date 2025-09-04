{4.- Realizar un programa que lea números y que utilice un módulo recursivo que escriba el
equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa
el número 0 (cero).

Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2.
¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la
próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa debe mostrar: 10111.}


program ej4p2;

procedure escribirBinario(n: integer);
begin
  if (n < 2) then
    write(n)
  else
  begin
    escribirBinario(n div 2);  { parte entera }
    writeln(n mod 2);            { dígito actual }
  end;
end;

var
  num: integer;

begin
  writeln('Ingrese un numero para convertirlo en decimal');
  readln(num);

  while (num <> 0) do
  begin
    write('El numero ', num, ' en binario es: ');
    escribirBinario(num);
    writeln;  
    writeln('Ingrese un numero para convertirlo en decimal');
    readln(num);
  end;
end.
