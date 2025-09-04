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
	info=record
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
		
	
procedure cargarAlumnos(var a:arbol);
{---------------------------------------------------------------------}

var
 a:arbol;num:real; {nota puesto como real para hacer el promedio}
begin
	a:= nil;
	cargarAlumnos(a); //INCISO A 
	writeln('La cantidad de alumnos con legajo impar fue: ',impar(a); //INCISO B 
	informar(a); //INCISO C 
	writeln('Ingrese un valor: '); readln(num);
	supera(a,num); //INCISO D
end;

