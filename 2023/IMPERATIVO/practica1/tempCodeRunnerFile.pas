Procedure ordenPorSeleccion( V:vector; dimL:rango);

Var 
  i,j,k: rango;
  O: oficina;
Begin
  For i:=1 To dimL-1 Do
    Begin
      k := i;
      For j:= i+1 To dimL Do
        If V[j].cod < V[k].cod Then
          k := j;
      O := V[k];
      V[k] := V[i];
      V[i] := O;
    End;
  WriteLn('*** Vector ordenado por seleccion ***');
  imprimirVector(V,dimL);
End;