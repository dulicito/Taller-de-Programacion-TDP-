{DEVUELVE BOOLEAN}

function buscar (a:arbol; x:integer): boolean; 

begin
  if (a = nil) then buscar:= false
  else (a^.dato = x) then buscar:= true

  else if (x > a^.dato) then buscar:= buscar(a^.HD, x)
  else buscar:= buscar(a^.HI, x)
end;
