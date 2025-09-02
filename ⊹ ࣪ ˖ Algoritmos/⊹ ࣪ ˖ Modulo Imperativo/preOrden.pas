Procedure preOrden (a:arbol);
begin
   if ( a <> nil ) then begin
      write (a^.dato);
      preOrden (a^.HI);
      preOrden (a^.HD);
   end;
end;
