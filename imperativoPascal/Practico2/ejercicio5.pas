// Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando
//  el siguiente encabezado:

// Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
// Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra en el vector.

Program ejercicio5;

Const 

Type 

Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; Var pos: indice);
Begin

End;

Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; Var pos: indice);
Begin
  pos := (ini + fin) Div 2;
  If (ini<= fin) Then
    Begin
      If (v[pos]>dato) Then
        busquedaDicotomica (v, ini, pos-1, dato, pos)
      Else If (v[pos]< dato) Then
             busquedaDicotomica(v, pos+1, fin, dato, pos);
    End
  Else If (v[pos]<>dato) Then
         pos := -1;
End;



Begin

End.
