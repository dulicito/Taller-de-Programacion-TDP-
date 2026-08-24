{3. Netflix ha publicado la lista de películas que estarán disponibles 
durante el mes de septiembre de 2025. De cada película se conoce: 
código de película, código de género (1: acción, 2: aventura, 3: drama, 
4: suspenso, 5: comedia, 6: bélico, 7: documental y 8:terror) y puntaje 
promedio otorgado por las críticas. Implementar un programa que
invoque a módulos para cada uno de los siguientes puntos:

a. Lea los datos de películas, almacenarlos por orden de llegada y 
agrupados por código de género, y retornar en una estructura de datos 
adecuada. La lectura finaliza cuando se lee el código de la película -1.

b. Genere y retorne en un vector, para cada género, el código de película 
con mayor puntaje obtenido entre todas las críticas, a partir de la 
estructura generada en a).

c. Ordene los elementos del vector generado en b) por puntaje utilizando 
el método visto en la teoría.

d. Muestre el código de película con mayor puntaje y el código de película
con menor puntaje, del vector obtenido en el punto c)}

program Netflix;

type
	rango_genero = 1..8;
	pelicula= record
		codigo: integer;
		genero: rango_genero;
		puntaje:real;
	end;
	
	lista= ^nodo;
	nodo = record
		dato : pelicula;
		sig : lista;
	end;
	
	vector= array[ rango_genero] of lista;
	
	mejorPelicula = record
		codigo: integer;
		puntaje: real;
	end;
	
	vectorMaximos = array[rango_genero]of mejorPelicula;

{-----------------------------------------------------------------------------------}

procedure inicializar(var v: vector);
var
  i: rango_genero;
begin
  for i := 1 to 8 do
    v[i] := nil;
end;

procedure leerPelicula(var p:pelicula);
begin
  p.codigo:= random(31)-1;
  if (p.codigo <> -1) then begin
    p.genero:= random(8)+1;
    p.puntaje:= random(100);
  end;
end;

procedure agregarAlFinal (var L:lista; p:pelicula);
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

{INCISO A:
* parametros: vector 
* 
* almacenar peliculas y agruparlos por codigo de genero(1..8)(usamos vector)
* corte de control: p.codigo = -1}

procedure cargarDatos(var v:vector);
var
	p:pelicula;
begin
	leerPelicula(p);
	while (p.codigo <> -1) do begin
		agregarAlFinal(v[p.genero],p);
		leerPelicula(p);
	end;
end;

{-----------------------------------------------------------------------------------}
function maxCodigo(l:lista):mejorPelicula;
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

  maxCodigo := maxPeli;
end;


{INCISO B: 
* parametros: vector peliculas y vector maximos
* 
* un vector de maximos que devuelve :
* 			codigo pelicula con mayor puntaje
* 
* }
procedure obtenerMaximos(peliculas:vector; var vectorMax: vectorMaximos);
var
	i:rango_genero;
begin
	for i:= 1 to 8 do
		vectorMax[i]:= maxCodigo(peliculas[i]);
end;

{-----------------------------------------------------------------------------------}
{INCISO C: 
* ordenar el vector de maximos, con uno de los algoritmos vistos en la catedra}

procedure insercion(var v: vectorMaximos);
var
  i, j: integer;
  actual: mejorPelicula;
begin
  for i := 2 to 8 do
  begin
    actual := v[i];
    j := i - 1;
    while ((j > 0) and (v[j].puntaje > actual.puntaje)) do
    begin
      v[j + 1] := v[j];
      j := j - 1;
    end;
    v[j + 1] := actual;
  end;
end;
{-----------------------------------------------------------------------------------}

{INCISO D: 
* imprimir del vector maximos:
* 		max y min de:
* 					codigo pelicula}

procedure imprimir(vectorMaximos: vectorMaximos); 
begin
  writeln('La pelicula con MENOR puntaje es: Codigo = ', vectorMaximos[1].codigo,
          ' | Puntaje = ', vectorMaximos[1].puntaje:0:2);
  writeln('La pelicula con MAYOR puntaje es: Codigo = ', vectorMaximos[8].codigo,
          ' | Puntaje = ', vectorMaximos[8].puntaje:0:2);
end;


var
	peliculas:vector;
	v: vectorMaximos;
begin
	randomize;
	
	inicializar(peliculas);
	
	cargarDatos(peliculas); {INCISO A}
	obtenerMaximos(peliculas,v);{INCISO B}
	insercion(v);{INCISO C}
	imprimir(v);{INCIDO D}
end.
