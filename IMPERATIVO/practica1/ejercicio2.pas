
Program ejercicio2;

Const 
  dimF = 30;

Type 
  rango = 1..dimF;

  oficina = Record
    cod: integer;
    dni: integer;
    expensa: real;
  End;

  vector = array[rango] Of oficina;

Procedure cargarVector(Var V:vector; Var dimL: integer);

Var 
  O: oficina;
Begin
  Randomize;
  O.cod := 1+ random(300);
  O.dni := 4000 + random (9000);
  O.expensa := 100 + random(9000);
  dimL := 0;
  While (O.cod<>-1)And(dimL<dimF) Do
    Begin
      dimL := dimL + 1;
      V[dimL] := O;
      O.cod := 1+ random(300);
      O.dni := 4000 + random (9000);
      O.expensa := 100 + random(9000);
    End;
End;

Procedure imprimirVector(V:vector ; dimL: integer);

Var 
  i: integer;
Begin
  For i:=1 To dimL Do
    Begin
      writeln('Codigo oficina: ',V[i].cod);
      writeln('Dni del propietario: ',V[i].dni);
      writeln('Expensas que paga la oficina: ',V[i].expensa: 4: 2);
    End;
End;

Procedure ordenPorInsercion (V:vector; dimL:rango);

Var 
  i,j: rango;
  actual: oficina;
Begin
  For i:=2 To dimL Do
    Begin
      actual := V[i];
      j := i-1;
      While (j>0) And (V[j].cod>actual.cod) Do
        Begin
          V[j+1] := V[j];
          j := j-1;
        End;
      V[j+1] := actual;
    End;
  WriteLn('*** Vector ordenado por insersion ***');
  imprimirVector(V,dimL);
End;

Procedure ordenPorSeleccion(V:vector; dimL:rango);

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

Var 
  dimL: integer;
  V: vector;
  Vo: vector;
Begin
  cargarVector(V,dimL);
  ordenPorInsercion(V,dimL);
  ordenPorSeleccion(V,dimL);
End.
