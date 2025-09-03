{   2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
    las expensas de dichas oficinas.
    Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
    
    a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
    se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
    finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
    
    b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
    oficina.
    
    c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina}
    
    program ej2p1;
    const
        maxofi= 300;
        corte= -1;
    type
        oficina = record
            codigo:integer;
            dni:integer;
            valorexpensa:real;
        end;
        vector= array[1..maxofi] of oficina;
        

    procedure leeroficina(var r: oficina);
    begin
		writeln('ingrese el codigo de la oficina');
        readln(r. codigo);
        if (r.codigo <> corte)then begin
			writeln('ingrese el dni del propietario');
            readln(r.dni);
            writeln('ingrese el valor de la expensa');
            readln(r.valorexpensa);
        end; 
    end;
    
    procedure generarVector (var v:vector; var dl:integer); //INCISO A 
    var 
        r:oficina; 
    begin
        dl:= 0; 
        writeln('ingrese los datos de la oficina: ', dl+1);
        leeroficina(r);
        while (r.codigo <> corte) and (dl < maxofi)do begin
            dl:= dl + 1;
            v[dl]:= r;
            writeln('ingrese los datos de la oficina: ',dl+1);
            leeroficina(r);
        end; 
    end;
        
    procedure inserccion (var v:vector; dl:integer); //MODULO B 
    var
        i,j:integer;
        actual:oficina; //actual es del tipo de datos que guarda el vector
     begin
        for i:= 2 to dl do begin
            actual:=v[i];
            j:=i-1;
            while (j>0) and (v[j].codigo > actual.codigo)do begin
                v[j+1]:=v[j];
                j:=j-1;
             end;
             v[j+1]:=actual;
        end;
     end;

    procedure seleccion (var v:vector; dl:integer); //MODULO C 
    Var
        i,j,pos:integer;
        item:oficina; //item es del tipo de datos que guarda el vector
    begin
        for i:=1 to dl -1 do begin
            pos:=i;
            for j:= i+1 to dl do begin
                if (v[j].codigo < v[pos].codigo) then
                    pos:=j;
                item:=v[pos];
                v[pos]:=v[i];
                v[i]:=item;
             end;
         end;
    end;
    
    
    var
        v: vector; dl:integer;
    begin 
        generarVector(v,dl);//modulo a 
        inserccion(v,dl);//modulo b 
        seleccion(v,dl);//modulo c 
    end.
