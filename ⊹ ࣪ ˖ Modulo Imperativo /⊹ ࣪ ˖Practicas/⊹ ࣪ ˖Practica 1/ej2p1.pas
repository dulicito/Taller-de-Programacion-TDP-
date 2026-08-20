{   2.- El administrador de un edificio de oficinas cuenta, en papel, 
    con la información del pago de las expensas de dichas oficinas.
    Implementar un programa que invoque a módulos para cada uno de los 
    siguientes puntos:
    
    a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que 
    administra. De cada oficina se ingresa el código de identificación, 
    DNI del propietario y valor de la expensa. La lectura finaliza 
    cuando se ingresa el código de identificación -1, el cual no se procesa.
    
    b. Ordene el vector aplicando el método de selección, por código de 
    identificación de la oficina}
    
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
    
    {INCISO A:
    * parametros: vector, dl
    * objetivo: cargar un vector(300 oficinas) SIN ORDEN
                hasta que codigo identificacion = -1 o
                hasta que se cargue todo el vector. 
                
                
     principal duda: preguntar si esta bien aplicado guardar
     los datos SIN ORDEN.}
                
    procedure generarVector (var v:vector; var dl:integer); 
    var 
        r:oficina; 
    begin
        writeln('ingrese los datos de la oficina: ', dl+1);
        leeroficina(r);
        while (r.codigo <> corte) and (dl < maxofi)do begin
            dl:= dl + 1;
            v[dl]:= r;
            writeln('ingrese los datos de la oficina: ',dl+1);
            leeroficina(r);
        end; 
    end;
        
	{INCISO B:
	* ninguna duda. }
	
    procedure seleccion (var v:vector; dl:integer); //inciso b 
    Var
        i,j,pos:integer;
        item:oficina; 
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
		dl:= 0; 
        generarVector(v,dl);//inciso a 
        seleccion(v,dl);//inciso b 
    end.
