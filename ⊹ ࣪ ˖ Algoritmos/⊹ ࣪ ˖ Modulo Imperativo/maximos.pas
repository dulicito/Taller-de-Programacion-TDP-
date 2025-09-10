{ DEVUELVE EL VALOR MAXIMO}

function maximo (a:arbol): integer; 

begin
  if (a^.HD = nil) then 
     maximo:= a^.dato

  else maximo:= maximo (a^.HD);
end;

function maximo (a:arbol): integer; 

begin
  while (a^.HD <> nil) do 
     a:= a^.HD;
  maximo:= a^.dato;
end;



{ DEVUELVE EL NODO QUE CONTIENE EL MAXIMO}

function maximoNodo (a:arbol): arbol; 

Begin
  if (a = nil) then maximoNodo:= nil
  else if (a^.HD = nil) then 
        maximoNodo:= a
  else maximoNodo:= maximoNodo (a^.HD);
end;


function maximoNodo (a:arbol): arbol; 
Begin
  if (a = nil) then maximoNodo:= nil
  else 
   while (a^.HD <> nil) do 
     a:= a^.HD; 
   maximoNodo:= a;
 end;
