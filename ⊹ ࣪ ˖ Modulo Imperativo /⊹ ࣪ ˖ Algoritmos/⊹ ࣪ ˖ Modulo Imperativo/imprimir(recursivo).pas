Procedure imprimir (VAR pri:lista);
Begin
  if (pri <> nil) then begin
     write (pri^.dato);
     pri:= pri^.sig;
     imprimir (pri);
    end;
 End;
