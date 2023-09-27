// 5.- Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el
// siguiente encabezado:
// Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
// Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
// en el vector.

Program ejercicio5;

Const 
  dimF = 10;

Type 
  rango = 1..dimF;
  vector = array [rango] Of integer;

Procedure cargarVector(Var V: vector; Var dimL: integer);

Var 
  num: integer;
Begin
  If (dimL<dimF) Then
    Begin
      dimL := dimL + 1 ;
      num := random(15);
      V[dimL] := num;
      cargarVector(V,dimL);
    End;
End;

Procedure busquedaDicotomica (V: vector; ini,fin: rango; dato:integer; Var pos: integer);

Var 
  medio: Integer;
Begin
  If (ini <= fin) Then
    Begin
      medio := (ini + fin) Div 2;
      If (V[medio] = dato) Then
        Begin
          pos := medio;
        End
      Else If (V[medio] < dato) Then
             busquedaDicotomica(V,medio+1,fin,dato,pos)
      Else
        busquedaDicotomica(V,ini,medio - 1,dato,pos);
    End;
End;


Procedure ordenPorSeleccion(Var V:vector; dimL:rango);

Var 
  i,j,k: rango;
  aux: integer;
Begin
  For i:=1 To dimL-1 Do
    Begin
      k := i;
      For j:= i+1 To dimL Do
        If V[j] < V[k] Then
          k := j;
      aux := V[k];
      V[k] := V[i];
      V[i] := aux;
    End;
  WriteLn('*** Vector ordenado por seleccion ***');
End;

Procedure imprimirVector(V: vector; dimL: integer);

Var 
  i: rango;
Begin
  For i:=1 To dimL Do
    write(V[i],' ');
End;


Var 
  V: vector;
  dimL,dato,pos: integer;
Begin
  dimL := 0;
  Randomize;
  cargarVector(V,dimL);
  ordenPorSeleccion(V,dimL);
  imprimirVector(V,dimL);
  WriteLn('');
  Write('Ingrese valor a buscar: ');
  Readln(dato);
  pos := -1;
  busquedaDicotomica(V,1,dimL,dato,pos);
  Writeln('El valor esta en la posicion: ',pos);
End.
