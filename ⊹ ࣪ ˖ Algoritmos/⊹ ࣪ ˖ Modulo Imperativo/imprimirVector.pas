{imprime de adelante hacia atras}

procedure imprimirVector(v:Vector; diml:integer);
begin
  if (diml > 0)then begin
    imprimirVector(v, diml -1);
    writeln(v[diml]);
  end;
end;

{imprime de atras hacia adelante}
procedure imprimirVector(v:Vector; diml:integer);
begin
  if (diml > 0)then begin
    writeln(v[diml]);
    imprimirVector(v, diml -1);
  end;
end;
