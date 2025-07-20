program NumAleatorio;
var 
    ale: integer;
begin
    randomize;
    ale := random (100);
    writeln ('El número aleatorio generado es: ', ale);
    readln;
end.