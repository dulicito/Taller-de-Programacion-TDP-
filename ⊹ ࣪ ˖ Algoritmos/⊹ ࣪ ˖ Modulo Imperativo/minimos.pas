{DEVUELVE EL VALOR MINIMO}

function minimo (a:arbol): integer; 

begin
  if (a^.HI = nil) then 
     minimo:= a^.dato

  else mínimo:= mínimo (a^.HI);
end;


function minimo (a:arbol): integer; 

begin
  while (a^.HI <> nil) do 
     a:= a^.HI;
  minimo:= a^.dato
end;


{DEVUELVE EL NODO QUE CONTIENE EL MINIMO}

function minimoNodo (a:arbol): arbol; 

Begin
  if (a = nil) then minimoNodo:= nil
  else if (a^.HI = nil) then 
        minimoNodo:= a;
  else mínimoNodo:= mínimoNodo (a^.HI);
end;



function minimoNodo (a:arbol): arbol; 
Begin
  if (a = nil) then minimoNodo:= nil
  else 
   while (a^.HI <> nil) do 
     a:= a^.HI; 
   minimoNodo:= a
 end;
