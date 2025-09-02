{DEVUELVE EL NODO BUSCADO}

function buscarNodo (a:arbol; x:integer): arbol; 

Begin
 if (a = nil) then buscarNodo:= nil
  else (a^.dato = x) then buscarNodo:= a

  else if (x > a^.dato) then 
                 buscarNodo:= buscarNodo(a^.HD, x)
  else buscarNodo:= buscarNodo(a^.HI, x);
End;
