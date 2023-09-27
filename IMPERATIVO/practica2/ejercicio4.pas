// 4.- Escribir un programa con:
// a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 0 y
// menores a 100.
// b. Un módulo recursivo que devuelva el máximo valor del vector.
// c. Un módulo recursivo que devuelva la suma de los valores contenidos en el vector.

Program ejercicio4;

Const 
  dimF = 20;

Type 

  rango = 1..dimF;

  vector = array [rango] Of integer;

Procedure cargarVectorRecursivo(Var V: vector; dimL: integer);

Var 
  num: integer;
Begin
  If (dimL<dimF) Then
    Begin
      num := Random(100);
      writeln(num);
      V[dimL] := num;
      cargarVectorRecursivo(V,dimL+1);
    End;
End;

Function maximoValorRecursivo (V: vector; dimL: integer): integer;

Var 
  max: integer;
Begin
  If (dimL < dimF) Then
    Begin
      max := maximoValorRecursivo (V,dimL+1);
      If (V[dimL] > max) Then
        maximoValorRecursivo := V[dimL]
      Else
        maximoValorRecursivo := max;
    End
  Else
    maximoValorRecursivo := V[dimL];
End;

Function sumaVectorRecursivo (V:vector ; dimL: integer): integer;
Begin
  If (dimL<dimF) Then
    sumaVectorRecursivo := V[dimL] + sumaVectorRecursivo(V,dimL+1);
End;

Var 
  V: vector;
  dimL: integer;
Begin
  dimL := 1;
  Randomize;
  cargarVectorRecursivo(V,dimL);
  writeln('El valor maximo en el vector es: ',maximoValorRecursivo(V,dimL));
  writeln('El valor de la suma de los valores del vector es: ',sumaVectorRecursivo(V,dimL));
End.
