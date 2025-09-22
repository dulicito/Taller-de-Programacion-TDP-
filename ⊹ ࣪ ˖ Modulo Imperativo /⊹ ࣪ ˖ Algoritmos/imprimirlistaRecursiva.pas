{de adelante hacia atras}
procedure imprimirlistaRecursiva( l:lista);
begin
  if (l<>nil)then begin
    writeln(l^.dato);
    imprimirlistaRecursiva(l^.sig);
  end;
end;

  {de atras hacia adelante}
procedure imprimirlistaRecursiva( l:lista);
begin
  if (l<>nil)then begin
    imprimirlistaRecursiva(l^.sig);
    writeln(l^.dato);
  end;
end;
