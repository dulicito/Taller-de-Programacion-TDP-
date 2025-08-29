{ un gimnasio necesita procesar las asistencias de sus clientes. cada
  asistencia tiene dia, mes, año, numero de cliente(entre 1 y 500) y la 
  actividad realizada(valor entre 1 y 5).
  a) implemente un modulo que retorne una lista de asistencia de clientes a
  un gimnasio. las asistencias dentro de la lista deben quedar ordenadas de 
  menor a mayor por numero de cliente. generar aleatoriamente los valores hasta
  generar un valor cero para el numero de cliente.
  b) implemente un modulo que reciba la lista generada en a) e imprima todos
  los valores de la lista en el mismo orden que estan almacenados.
  c) implemente un modulo que reciba la lista generada en a) y un numero de 
  cliente y retorne la cantidad de asistencias del cliente recibido. Mostrar
  el resultado desde el programa principal.
  d) implemente un modulo que reciba la lista generada en a) y retorne la 
  actividad con mayor cantidad de asistencias. Mostrar el resultado desde
  el programa principal.}


program gimnasio;
const
    maxcli = 500;
    maxact = 5;
    maxdia = 31;
    maxmes = 12;
type
    dias = 1..maxdia;
    meses = 1..maxmes;
    clientes = 0..maxcli; // incluye el 0 para el corte
    acts = 1..maxact;

    Asistencia = record
        dia: dias;
        mes: meses;
        anio: integer;
        numcli: clientes;
        act: acts;
    end;

    lista = ^nodo;
    nodo = record
        info: Asistencia;
        sig: lista;
    end;

    vectoractividad = array[acts] of integer;

{------------------- PROCEDIMIENTOS AUXILIARES -------------------}

procedure inicializarvector(var v: vectoractividad);
var
	i: integer;
begin
    for i := 1 to maxact do
        v[i] := 0;
end;

procedure leerregistro(var r: Asistencia);
begin
    r.numcli := random(maxcli+1); // genera entre 0 y 500
    if r.numcli <> 0 then begin
        r.dia := random(maxdia)+1;
        r.mes := random(maxmes)+1;
        r.anio := 2025;
        r.act := random(maxact)+1;
    end;
end;

procedure insertarordenado(var l: lista; r: Asistencia);
var
    ant, act, nue: lista;
begin
    new(nue);
    nue^.info := r;
    ant := nil;
    act := l;
    while (act<>nil) and (act^.info.numcli < r.numcli) do begin
        ant := act;
        act := act^.sig;
    end;
    if ant = nil then begin
        nue^.sig := l;
        l := nue;
    end
    else begin
        ant^.sig := nue;
        nue^.sig := act;
    end;
end;

procedure imprimirregistro(r: Asistencia);
begin
    writeln('Cliente: ', r.numcli,
            ' | Fecha: ', r.dia,'/',r.mes,'/',r.anio,
            ' | Actividad: ', r.act);
end;

{------------------- INCISO A -------------------}
procedure cargarlista(var l: lista; var v: vectoractividad);
var
    r: Asistencia;
begin
    inicializarvector(v);
    leerregistro(r);
    while (r.numcli <> 0) do begin
        v[r.act] := v[r.act] + 1;
        insertarordenado(l, r);
        leerregistro(r);
    end;
end;

{------------------- INCISO B -------------------}
procedure imprimir(l: lista);
begin
    while (l <> nil) do begin
        imprimirregistro(l^.info);
        l := l^.sig;
    end;
end;

{------------------- INCISO C -------------------}
function asistenciasdelcliente(l: lista; num: integer): integer;
var
    cant: integer;
begin
    cant := 0;
    while (l <> nil) do begin
        if (l^.info.numcli = num) then
            cant := cant + 1;
        l := l^.sig;
    end;
    asistenciasdelcliente := cant;
end;

{------------------- INCISO D -------------------}
function maxactividad(v: vectoractividad): integer;
var
    i, maxval, pos: integer;
begin
    maxval := -1;
    pos := -1;
    for i := 1 to maxact do begin
        if v[i] > maxval then begin
            maxval := v[i];
            pos := i;
        end;
    end;
    maxactividad := pos;
end;

{------------------- PROGRAMA PRINCIPAL -------------------}
var
    l: lista;
    v: vectoractividad;
    num: integer;
begin
    randomize; //nunca olvidar de declarar este randomize ;-;
    l := nil;
    cargarlista(l, v); // inciso A
    writeln('--- LISTA DE ASISTENCIAS ---');
    imprimir(l); // inciso B

    writeln; writeln('Ingrese un numero de cliente: '); readln(num);
    writeln('El cliente ', num, ' tuvo ',
            asistenciasdelcliente(l, num),
            ' asistencias.'); // inciso C

    writeln('La actividad con mayor cantidad de asistencias es: ',
            maxactividad(v)); // inciso D
end.
