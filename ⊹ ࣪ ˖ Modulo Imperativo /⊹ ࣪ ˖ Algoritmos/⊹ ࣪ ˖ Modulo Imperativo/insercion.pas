Procedure insercion ( var v: vector; dimLog: indice );
Var
 i, j: indice; actual: integer;	
		
begin
 for i:= 2 to dimLog do begin 
     actual:= v[i];
     j:= i-1; 
     while (j > 0) y (v[j] > actual) do      
       begin
         v[j+1]:= v[j];
         j:= j – 1;                  
       end;  
     v[j+1]:= actual; 
 end;
end;
