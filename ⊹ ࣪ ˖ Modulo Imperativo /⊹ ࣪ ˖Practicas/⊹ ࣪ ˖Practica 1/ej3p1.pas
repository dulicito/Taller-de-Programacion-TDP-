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
métodos vistos en la teoría.
d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
del vector obtenido en el punto c). }

program ej3p1;

type
	rango_genero= 1..8;
	pelicula=record
		codigo:integer;
		genero:rango_genero;
		puntaje:real;
	end;
	lista=^nodo;
	nodo=record
		dato:pelicula;
		sig:lista;
	end;
	
	vector =array [rango_genero]of lista;
	
	vectorContador= array [rango_genero]of integer;
	

procedure agregarAlFinal(var l:lista; p:pelicula);

........

{ insertar al final y recorrer toda la lista no es una buena opcion}
procedure cargarDatos(var v:Vector); //MODULO A 
var
	p:pelicula;
begin
	inicializar(v);
	leerPelicula(p);
	while (p.codigo <> -1)do begin
		agregarAlFinal(v[p.genero],p);
		leerPelicula(p);
	end;
end;

function maxCodigo(l:lista):integer;
begin
.....
end;


procedure obtenerMaximos(peliculas: vector; var vectorMaximos: vectorContador);
var
	i: rango_genero;
begin
	for i:= 1 to 8 do begin 
		vectorMaximos[i]:= maxCodigo(peliculas[i]);
		
end;



var
	peliculas:vector;
	vectorMaximos: vectorContador;
begin
	cargarDatos(v);//INCISO A
	obtenerMaximos(peliculas,vectorMaximos); //INCISO B 
    
end;

{
d) debo recorrer el vector buscando maximos y minimos?
no, acabo de ordenarlo, si se que ordene de menor a mayor 
el vector debo tener en cuenta eso, recorrer el vector
esta MAL . 
nota: terminar dsp }