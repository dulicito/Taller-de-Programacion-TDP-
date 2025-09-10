{1. El administrador de un edificio de oficinas tiene la información del pago de las expensas
de dichas oficinas. Implementar un programa con:

a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se deben cargar, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación 0.

b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.

c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.

d) Un módulo recursivo que retorne el monto total acumulado de las expensas.}

program ej1pAD;
const
    DF=300;
    corte=0;
type
    oficina=record
        codigo:integer;
        dni_propietario:integer;
        valor_expensas:real;
    end;
    
    vector= array[1..DF]of oficina;
    
    
{-----------------------------------------------------------------------------}
    
{a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se deben cargar, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación 0.}

procedure leerOficina(var o:oficina);
begin
    o.codigo:= random(70);
    o.dni_propietario:= random(40);
    o.valor_expensas:= random(50);
end;

procedure cargarvector(var v:vector; var dl:integer);
var
    o:oficina; 
begin
    leerOficina(o);
    while (dl<DF)and (o.codigo <> 0)do begin
        dl:= dl +1;
        v[dl]:= o;
        leerOficina(o);
    end;
        
end;

{----------------------------------------------------------------------------}

{b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.}


procedure seleccion(var v:vector;dl: integer);
var
	pos, i, j  : integer;
	o : oficina;
begin
	if(dl > 0) then begin
		for i := 1 to dl -1 do begin
			pos := i;
			for j := i + 1 to dl do
				if(v[j].codigo < v[pos].codigo) then
					pos := j;
			o := v[pos];
			v[pos] := v[i];
			v[i] := o;
		end;
	end;
end;


{----------------------------------------------------------------------------}

{c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.}


function busquedadicotomica(v:vector;codigo:integer; dl,pri,fin:integer):integer;
var
    medio: integer;
begin
	if(dl > 0) then
		begin
			if(pri <= fin) then
				begin
					medio:= (pri + fin) div 2;
					if(v[medio].codigo = codigo) then
						busquedadicotomica := medio
					else if(codigo < v[medio].codigo) then
						busquedadicotomica := busquedadicotomica(v, codigo, dl, pri, medio-1)
					else
						busquedadicotomica := busquedadicotomica(v, codigo, dl, medio+1, fin);
				end
			else
				busquedadicotomica := 0;
		end
	else
		busquedadicotomica := 0;
end;

{----------------------------------------------------------------------------}
{d) Un módulo recursivo que retorne el monto total acumulado de las expensas.}

function montoTotal (v:vector; dl:integer):real;
begin
    if (dl > 0)then 
        montoTotal:= (v[dl].valor_expensas) + montoTotal(v, dl-1)
    else
        montoTotal:= 0; 
end;

{----------------------------------------------------------------------------}
var
    v:vector; dl:integer; cod:integer; pri,fin:integer; aux:integer;
begin
    randomize;
    dl:= 0; 
    cargarvector(v,dl); //INCISO A 
    seleccion(v,dl); //INCISO B 
    writeln('Ingrese un codigo de oficina para buscar si existe'); //INCISO C 
    readln(cod); //INCISO C 
    pri:= 1; fin:= dl; //INCISO C 
    aux:= busquedaDicotomica(v,cod,dl,pri,fin); //INCISO C 
    if (aux= 0)then begin
        writeln('Se encontro la oficina con el codigo: ',cod,' en la posicion',aux);
        writeln('El DNI es: ',v[aux].dni_propietario)
    end
    else writeln('No se encontro la oficina'); //INCISO C
    writeln('El monto total de las expensas es de: ',montoTotal(v,dl) ); //INCISO D 
end.
