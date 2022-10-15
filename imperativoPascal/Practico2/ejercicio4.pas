// Escribir un programa que:

// a. Implemente un módulo recursivo que genere un vector de 20 números enteros “random” mayores
//    a 0 y menores a 100.

// b. Implemente un módulo recursivo que devuelva el máximo valor del vector.
// c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos en el vector.

Program ejercicio4;

Const 
  dimF = 20;

Type 
  vectNum = array [0..dimF] Of Integer;

Procedure cargarVect (Var V:vectNum; i:integer);

Var 
  N: Integer;
Begin
  If (i<dimF)Then
    Begin
      N := random(100);
      writeln('numero:',N);
      V[i] := N;
      cargarVect(V,(i+1));
    End;
End;

Function buscarMaxVal (V:vectNum ; i: Integer): Integer;

Var 
  max: integer;
Begin
  If (i < dimF) Then
    Begin
      max := buscarMaxVal (V,i+1);
      If (V[i] > max) Then {si el valor es mayor que el maximo actualizo}
        buscarMaxVal := V[i]
      Else {sino mantengo el maximo }
        buscarMaxVal := max;
    End
  Else {si es el último elemento lo tomo como mínimo para comenzar}
    buscarMaxVal := V[i];
End;


Function sumarVal (V:vectNum ; i:Integer): Integer;
Begin
  If (i<dimF) Then {si no llega a la dimF}
    sumarVal := V[i] + sumarVal(V,i+1);
End;

Var 
  i: integer;
  V: vectNum;
Begin
  i := 1;
  Randomize;
  cargarVect(V,i);
  WriteLn(buscarMaxVal(V,i));
  WriteLn(sumarVal(V,i));
End.
