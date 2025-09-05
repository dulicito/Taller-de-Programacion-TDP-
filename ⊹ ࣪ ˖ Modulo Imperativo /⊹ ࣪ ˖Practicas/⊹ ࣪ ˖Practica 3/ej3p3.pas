{Implementar un programa que contenga:

a. Un módulo que lea información de los finales rendidos por los alumnos de la Facultad de
Informática y los almacene en una estructura de datos. La información que se lee es legajo,
código de materia, fecha y nota. La lectura de los alumnos finaliza con legajo 0. La estructura
generada debe ser eficiente para la búsqueda por número de legajo y para cada alumno deben
guardarse los finales que rindió en una lista.

b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.

c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
su cantidad de finales aprobados (nota mayor o igual a 4).

d. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}


{nota: terminar de hacer}

program ej3p3;
const
type
	final=record
		codigo_mate:integer;
		fecha:string;
		nota:real;
	end;
	
	lista=^nodo
		nodo=Record;
			info:final;
			sig:lista;
		end;
	alumno=Record;
		legajo:integer;
		finales: lista;
	end;
	
	arbol=^nodo
		nodo=Record
			info:alumno;
			hi:arbol;
			hd:arbol;
		end;
		
{---------------------------------------------------------------------}

{a. Un módulo que lea información de los finales rendidos por los alumnos de la Facultad de
Informática y los almacene en una estructura de datos. La información que se lee es legajo,
código de materia, fecha y nota. La lectura de los alumnos finaliza con legajo 0. La estructura
generada debe ser eficiente para la búsqueda por número de legajo y para cada alumno deben
guardarse los finales que rindió en una lista.}
		
	
procedure agregar (l:lista);
var
    aux:lista;
begin
    new(aux);
    aux^.info.codigo_mate:= random(1000)+1;
    aux^.info.fecha:= random(1000);
    aux^.info.nota:= random(1000);
    aux^.sig:= l;
    l:= aux;
end;
    
    
procedure leeralumno(var a:alumno);
var
    cant: integer;
begin
    writeln('Ingrese el legajo del alumno: ');
    readln(a.legajo);
    writeln('Ingrese la cantidad de finales rendidos por el alumno');
    readln(cant);
    while (cant <> 0)do begin 
        a^.finales:= agregar(a^.finales);
        cant:= cant -1;
    end;
end;


procedure agregarnodo(var a:arbol; p:alumno );
begin
    if (a = nil)then
        new(a)
        a^.info:= p;
        a^.hi:= nil;
        a^.hd:= nil;
    else
        if (p.legajo <= a^.legajo) then agregarnodo(a^.hi,p)
        else agregarnodo(a^.hd, p);
end;


procedure cargarAlumnos(var a:arbol);
var 
    p:alumno;
begin
    leeralumno(p);
    while (p.legajo <> 0)do begin
        agregarnodo(a,p);
        leeralumno(p);
    end;
end;

{---------------------------------------------------------------------}

{b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.}


function impar(a:arbol): integer;
begin
  if a = nil then             // Caso base: si el árbol está vacío
    impar := 0
  else
  begin
    if (a^.info.legajo mod 2 <> 0) then      // Si el legajo del alumno es impar...
      impar := 1 + impar(a^.hi) + impar(a^.hd)
    else                                // Si es par...
      impar := impar(a^.hi) + impar(a^.hd);
  end;
end;



{---------------------------------------------------------------------}
{c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
su cantidad de finales aprobados (nota mayor o igual a 4).}




{---------------------------------------------------------------------}



var
 a:arbol;num:real; {nota puesto como real para hacer el promedio}
begin
	a:= nil;
	randomize;
	cargarAlumnos(a); //INCISO A 
	writeln('La cantidad de alumnos con legajo impar fue: ',impar(a); //INCISO B  {ahora que lo pienso puede ser un procedure pero mmm dijo el mudo, digo, dsp veo
	informar(a); //INCISO C 
	writeln('Ingrese un valor: '); readln(num);
	supera(a,num); //INCISO D
end;
