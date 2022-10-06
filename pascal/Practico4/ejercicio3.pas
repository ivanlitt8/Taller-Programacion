
Program ejercicio3;

Const 
  dimF = 4;

Type 
  rango = 0..dimF;

  venta = Record
    cod: integer;
    suc: rango;
    cant: integer;
  End;

  venta2 = Record
    cod: Integer;
    total: Integer;
  End;

  lista = ^nodo;
  nodo = Record
    data: venta;
    sig: lista;
  End;

  listaNueva = ^nodoN;
  nodoN = Record
    data: venta2;
    sig: listaNueva;
  End;

  vectSuc = array[rango] Of lista;

Procedure cargarVector(Var V: vectSuc);

Procedure leerVenta (Var X:venta);
Begin
  WriteLn('Ingrese Sucursal: ');
  ReadLn(X.suc);
  If (X.suc<>0)Then
    Begin
      WriteLn('Ingrese Codigo Producto: ');
      ReadLn(X.cod);
      WriteLn('Ingrese Cantidad: ');
      ReadLn(X.cant);
    End;
End;

Procedure   inicializVect(Var V: vectSuc);

Var 
  i: integer;
Begin
  For i:=1 To dimF Do
    V[i] := Nil;
End;

Procedure insertarOrdenado (Var L:lista; X:venta);

Var 
  nue: lista;
  act,ant: lista;
Begin
  new(nue);
  nue^.data := X;
  act := L;
  ant := L;
  While (act<>Nil) And (X.cod < act^.data.cod ) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (act=ant) Then
    L := nue
  Else
    ant^.sig := nue;
  nue^.sig := act;
End;

Var 
  X: venta;
Begin
  inicializVect(V);
  leerVenta(X);
  While (X.suc<>0) Do
    Begin
      insertarOrdenado(V[X.suc],X);
      leerVenta(X);
    End;
End;


Procedure mergeAcumulador(V: vectSuc; Var Lm: listaNueva);


Procedure minimo(Var v:vectSuc; Var min:integer; Var cant:integer);

Var indiceMin, i: rango;
Begin
  min := 999;
  For i:=1 To dimF Do
    If V[i] <> Nil Then
      If V[i]^.data.cod < min Then
        Begin
          indiceMin := i;
          min := V[i]^.data.cod;
        End;

  If min <> 999 Then
    Begin
      cant := V[indiceMin]^.data.cant;
      V[indiceMin] := V[indiceMin]^.sig;
    End;

End;

Procedure agregarAdelante (Var Lm:listaNueva; actual, cant:integer);

Var 
  nue: listaNueva;
Begin
  new(nue);
  nue^.data.cod := actual;
  nue^.data.total := cant;
  nue^.sig := Lm;
  Lm := nue;
End;


Var 
  minCod, actual, cant, contador: integer;

Begin
  Lm := Nil;
  minimo(V, minCod, contador);
  While (minCod <> 999) Do
    Begin
      actual := minCod;
      cant := 0;
      While (minCod <> 999) And (actual = minCod) Do
        Begin
          cant := cant + contador;
          minimo(V, minCod, contador);
        End;
      agregarAdelante(Lm, actual, cant);
    End;
End;


Procedure imprimirListaNueva (Lm:listaNueva);
Begin
  If (Lm<>Nil) Then
    Begin
      writeln('---------------------');
      writeln('Producto Codigo: ',Lm^.data.cod);
      writeln('Total Ventas: ',Lm^.data.total);
      writeln('---------------------');
      imprimirListaNueva(Lm^.sig);
    End;
End;


Var 
  Lm: listaNueva;
  V: vectSuc;
Begin
  cargarVector(V);
  mergeAcumulador(V,Lm);
  imprimirListaNueva(Lm);
End.
