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

//nota: revisar, se usa un vector de listas !!!!!
//nota: cuando diga ordenado por x criterio y agrupado por x criterio siempre va a ser un vector de listas 
program ej3p1;
const
	maxgen: 8;
	corte: -1;
type
	generos: 1..maxgen;
	pelicula=record
		codigo:integer;
		cod_gen:generos;
		puntaje_prom:real;
	end;
	
	listapeliculas= ^nodo
		nodo=record
			info:pelicula;
			sig:listapeliculas;
		end;
	vector= array[generos]of real;
	
{------------------MODULOS-----------------------------}

{a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
código de la película -1.}

procedure generarestructura (var l:listapeliculas)
var
	r:pelicula;
begin
	leerregistro(r);
	while (r.codigo <> 0)do begin
		insertarordenado(l,r);
		leerregistro(r);
	end;
end;

{b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a)..
* 
* pseudocodigo:
* objetivo: 
* 	guardar en cada pos del vector el codigo de pelicula con mayor puntaje (>puntaje_prom)
* 
* aviso: debe haber un corte de control ya que la lista esta ordenada por GENERO!!!!
* 
* algoritmo:
* mientras la lista NO este vacia 
* 	guardo el cod de generoactual 
* 	inicializo max para usarlo solo por genero 
* 	mientras sigo recorriendo la lista con el mismo cod de genero
* 		si puntaje prom mayor que max
* 			actualizo max 
* 		paso al siguiente nodo 
* 	guardo max en la pos del genero en el vector
* paso al siguiente nodo 
* }

procedure generarvector(var l: listapeliculas; var v:vector);
var
begin
	while (l <> nil)do begin
		cod_act:= l^.info.codigo;
		max:= -9999999;
		while (l^.info.codigo = cod_act)do begin 
			if (l^.info.puntaje_prom > max)then begin
				max:= l^.info.puntaje_prom;
				genero_Actual:= l^.info.cod_gen;
			end;
			l:= l^.sig;
		end;
		v[genero_Actual]:= max;
		l:= l^.sig;
	end;
end;


{c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría.}


procedure ordenarvector(var v:vector);
var
begin
end;

{------------------PROGRAMA PRINCIPAL------------------}
var
	l:listapeliculas; v:vector;
begin
	l:= nil;
	generarestructura(l); //inciso A 
	generarvector(l,v);//Inciso B
	ordenarvector(v);//Inciso C
	imprimir(v);//Inciso D 
end;

