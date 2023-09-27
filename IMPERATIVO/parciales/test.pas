// El administrador de un edificio de oficinas, cuenta en papel, con la información del pago
// de las expensas de dichas oficinas. Implementar un programa con:
// a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
// administra. Se debe leer, para cada oficina, el código de identificación, DNI del
// propietario y valor de la expensa. La lectura finaliza cuando llega el código de
// identificación -1.
// b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
// código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
// vistos en la cursada.
// c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
// generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
// retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
// Luego el programa debe informar el DNI del propietario o un cartel indicando que no
// se encontró la oficina.
// d) Un módulo recursivo que retorne el monto total de las expensas.


Program test;

Const 
  dimF = 30;

Type 

  rango = 1..dimF;

  oficina = Record
    cod: integer;
    dni: integer;
    valor: real;
  End;

  vector = array [rango] Of oficina;

Procedure leerOficina(Var O: oficina);
Begin
  O.cod := -1 + Random(100);
  If (O.cod <> -1) Then
    Begin
      O.dni := 1000 + Random(1000);
      O.valor := 5000 + Random(5000);
    End;
End;

Procedure cargarVector(Var V:vector; Var dimL: integer);

Var 
  O: oficina;
Begin
  Randomize;
  leerOficina(O);
  While (dimL < dimF) And (O.cod<>-1) Do
    Begin
      dimL := dimL + 1;
      V[dimL] := O;
      leerOficina(O);
    End;
End;

Procedure imprimirVector(V: vector ; dimL: integer);

Var 
  i: rango;
Begin
  For i:= 1 To dimL Do
    Begin
      writeln(' +++++ Propiedad ',i,' +++++ ');
      writeln('Oficina codigo: ',V[i].cod);
      writeln('DNI propietario: ',V[i].dni);
      writeln('Precio de propiedad: ',V[i].valor:4:2);
    End;
End;

Var 
  V: vector;
  dimL: integer;
Begin
  dimL := 0;
  cargarVector(V,dimL);
  imprimirVector(V,dimL);
End.

Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; Var pos: indice);
Begin
  pos := (ini + fin) Div 2;
  If (ini<= fin) Then
    Begin
      If (v[pos]>dato) And (dato <> v[pos]) Then
        busquedaDicotomica (v, ini, pos-1, dato, pos)
      Else If (v[pos]< dato) Then
             busquedaDicotomica(v, pos+1, fin, dato, pos);
    End
  Else If (v[pos]<>dato) Then
         pos := -1;
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


Procedure ordenPorInsercion (Var V:vectOficinas; dimL:integer);

Var 
  i,j: integer;
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
End;
