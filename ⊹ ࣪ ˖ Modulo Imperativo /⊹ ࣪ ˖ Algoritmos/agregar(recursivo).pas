Procedure agregar (var a:arbol; num:integer);
Begin
  if (a = nil) then begin
      new(a);
      a^.dato:= num; a^.HI:= nil; a^.HD:= nil;
   end
   else
    if (num <= a^.dato) then agregar(a^.HI,num)
    else agregar(a^.HD,num)   
End;
