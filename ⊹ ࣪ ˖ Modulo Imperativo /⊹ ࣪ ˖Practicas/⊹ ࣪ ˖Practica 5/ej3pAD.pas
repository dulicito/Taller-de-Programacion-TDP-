{3. PlayStation Store requiere procesar las compras realizadas por sus clientes durante el año
2023
a) Implementar un módulo que lea compras de videojuegos. De cada compra se lee
código del videojuego, código de cliente y mes. La lectura finaliza con el código de
cliente 0. Se sugiere utilizar el módulo leerCompra(). El módulo debe retornar un árbol
binario de búsqueda ordenado por código de videojuego. En el árbol, para cada código
de videojuego debe almacenarse una lista con código de cliente y mes perteneciente a
cada compra.
b) Implementar un módulo que reciba el árbol generado en a) y un código de videojuego.
El módulo debe retornar la lista de las compras de ese videojuego.
c) Implementar un módulo recursivo que reciba la lista generada en b) y un mes. El
módulo debe retorne la cantidad de clientes que compraron en el mes ingresado.
NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.}

{procedure leerCompra (var c : compra);
begin
    c.cod_cliente := Random(200);
    if (c.cod_cliente <> 0) then begin
        c.mes := Random(12) + 1;
        c.cod_videojuego := Random(200) + 1000;
    end;
end;}

{ya me duele el cerebro, mañana lo termino xd}

program ej3pAD;
const
    maxmes:12;
type
    meses: 1..maxmes;
    compra = record
        cod_videojuego : integer;
        cod_cliente : integer;
        mes : meses;
    end;
    
var

begin

end.
