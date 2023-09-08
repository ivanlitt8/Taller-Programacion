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

Program ejercicio1;

Const 
  dimF = 5;

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
  While (O.cod<>-1) And (dimL < dimF) Do
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

Procedure ordenPorSeleccion(Var V: vector; dimL: Integer);

Var 
  i,j,k: rango;
  O: oficina;
Begin
  For i:= 1 To dimL-1 Do
    Begin
      k := i;
      For j:= i+1 To dimL Do
        If (V[j].cod < V[k].cod) Then
          k := j;
      O := V[k];
      V[k] := V[i];
      V[i] := O;
    End;
  WriteLn('*** Vector ordenado por seleccion ***');
  imprimirVector(V,dimL);
End;

Procedure busquedaDicotomica (V: vector; ini,fin,dato:integer; Var pos: integer);
Begin
  pos := (ini + fin) Div 2;
  If (ini <= fin) Then
    Begin
      If (V[pos].cod>dato) Then
        busquedaDicotomica (V, ini, pos-1, dato, pos)
      Else If (V[pos].cod< dato) Then
             busquedaDicotomica(V, pos+1, fin, dato, pos);
    End
  Else If (V[pos].cod<>dato) Then
         pos := 0;
End;

Procedure buscarOficina(V:vector; dimL: Integer);

Var 
  cod,pos: integer;
Begin
  pos := 0;
  write('Ingrese codigo: ');
  readln(cod);
  busquedaDicotomica(V,1,dimL,cod,pos);
  If (pos = 0) Then
    WriteLn('No se encontro la oficina')
  Else
    WriteLn('El propietario de esta propiedad es: ',V[pos].dni);
End;

Function calcularTotal(V: vector; dimL: integer): real;
Begin
  If (dimL>0) Then
    calcularTotal := calcularTotal(V,dimL-1) + V[dimL].valor
  Else
    calcularTotal := 0;
End;

Procedure totalExpensas(V: vector ; dimL: Integer);
Begin
  WriteLn('El monto total de expensas es: ',calcularTotal(V,dimL): 4: 2);
End;

Var 
  V: vector;
  dimL: integer;
Begin
  dimL := 0;
  cargarVector(V,dimL);
  //   imprimirVector(V,dimL);
  ordenPorSeleccion(V,dimL);
  //   buscarOficina(V,dimL);
  totalExpensas(V,dimL);
End.
