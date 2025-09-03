{3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
septiembre de 2025. De cada película se conoce: código de película, código de género (1:
acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y
puntaje promedio otorgado por las críticas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:

a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
código de la película -1.

b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a)..

c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría

d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
del vector obtenido en el punto c). }


program ej3p1;

const
  maxgen = 8;

type
  rango_genero = 1..maxgen;

  pelicula = record
    codigo: integer;
    genero: rango_genero;
    puntaje: real;
  end;

  lista = ^nodo;
  nodo = record
    dato: pelicula;
    sig: lista;
  end;

  vector = array[rango_genero] of lista;

  mejorPelicula = record
    codigo: integer;
    puntaje: real;
  end;

  vectorMejores = array[rango_genero] of mejorPelicula;

{------------------------------------------------------------------}
procedure agregarAlFinal(var l: lista; p: pelicula); //PREGUNTAR por este INCISO 
var
  nue, aux: lista;
begin
  new(nue);
  nue^.dato := p;
  nue^.sig := nil;

  if l = nil then
    l := nue
  else
  begin
    aux := l;
    while aux^.sig <> nil do
      aux := aux^.sig;
    aux^.sig := nue;
  end;
end;

{------------------------------------------------------------------}
procedure leerPelicula(var p: pelicula);
begin
  writeln('Ingrese el codigo de la pelicula:');
  readln(p.codigo);
  if (p.codigo <> -1) then
  begin
    writeln('Ingrese el genero de la pelicula (1..8):');
    readln(p.genero);
    writeln('Ingrese el puntaje de la pelicula:');
    readln(p.puntaje);
  end;
end;

{------------------------------------------------------------------}
procedure inicializar(var v: vector);
var
  i: rango_genero;
begin
  for i := 1 to maxgen do
    v[i] := nil;
end;

{------------------------------------------------------------------}
procedure cargarDatos(var v: vector); //INCISO A 
var
  p: pelicula;
begin
  inicializar(v);
  writeln('Ingrese los datos de la pelicula: ');
  leerPelicula(p);
  while (p.codigo <> -1) do
  begin
    agregarAlFinal(v[p.genero], p);
    writeln('Ingrese los datos de la pelicula: ');
    leerPelicula(p);
  end;
end;

{------------------------------------------------------------------}
function mejorDeLista(l: lista): mejorPelicula;
var
  maxPeli: mejorPelicula;
begin
  maxPeli.codigo := -1;
  maxPeli.puntaje := -1;

  while (l <> nil) do
  begin
    if l^.dato.puntaje > maxPeli.puntaje then
    begin
      maxPeli.codigo := l^.dato.codigo;
      maxPeli.puntaje := l^.dato.puntaje;
    end;
    l := l^.sig;
  end;

  mejorDeLista := maxPeli;
end;

{------------------------------------------------------------------}
procedure obtenerMaximos(peliculas: vector; var vectorMaximos: vectorMejores); //INCISO B 
var
  i: rango_genero;
begin
  for i := 1 to maxgen do
    vectorMaximos[i] := mejorDeLista(peliculas[i]);
end;

{------------------------------------------------------------------}
{Anotacion: preguntar en clases, tengo entendido que 
este algoritmo es el mas eficiente pero igualmente no 
pierdo nada preguntando(? )}
procedure insercion(var v: vectorMejores); // INCISO C 
var
  i, j: integer;
  actual: mejorPelicula;
begin
  for i := 2 to maxgen do
  begin
    actual := v[i];
    j := i - 1;
    while (j > 0) and (v[j].puntaje > actual.puntaje) do
    begin
      v[j + 1] := v[j];
      j := j - 1;
    end;
    v[j + 1] := actual;
  end;
end;

{------------------------------------------------------------------}
{Anotacion: como ya el vector contador lo ordenamos de menor a 
mayor en el INCISO C, por logica entendemos que en la posicion 1 
esta guardado el valor minimo y en la ultima posicion esta guardada 
el valor maximo}
procedure imprimir(vectorMaximos: vectorMejores); //INCISO D 
begin
  writeln('La pelicula con MENOR puntaje es: Codigo = ', vectorMaximos[1].codigo,
          ' | Puntaje = ', vectorMaximos[1].puntaje:0:2);
  writeln('La pelicula con MAYOR puntaje es: Codigo = ', vectorMaximos[maxgen].codigo,
          ' | Puntaje = ', vectorMaximos[maxgen].puntaje:0:2);
end;

{------------------------------------------------------------------}
var
  peliculas: vector;
  vectorMaximos: vectorMejores;

begin
  cargarDatos(peliculas);                // INCISO A
  obtenerMaximos(peliculas, vectorMaximos); // INCISO B
  insercion(vectorMaximos);             // INCISO C
  imprimir(vectorMaximos);              // INCISO D
end.

