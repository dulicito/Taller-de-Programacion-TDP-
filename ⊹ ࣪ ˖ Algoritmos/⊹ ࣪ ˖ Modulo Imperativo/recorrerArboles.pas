{Los recorridos serian:
Inorden (izquierda, raíz, derecha)}

procedure Inorden(arbol: PArbol);
begin
  if arbol <> nil then
  begin
    Inorden(arbol^.izq);       
    WriteLn(arbol^.dato);              
    Inorden(arbol^.der);        
  end;
end;


{Preorden (raíz, izquierda, derecha)}

Procedure preOrden (a:arbol);
begin
   if ( a <> nil ) then begin
      write (a^.dato);
      preOrden (a^.HI);
      preOrden (a^.HD);
   end;
end;


{Postorden (izquierda, derecha, raíz)}

Procedure postOrden (a:arbol);
begin
   if ( a <> nil ) then begin
      postOrden (a^.HI);
      postOrden (a^.HD);
      write (a^.dato);
   end;
end;