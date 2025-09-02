Procedure postOrden (a:arbol);
begin
   if ( a <> nil ) then begin
      postOrden (a^.HI);
      postOrden (a^.HD);
      write (a^.dato);
   end;
end;
