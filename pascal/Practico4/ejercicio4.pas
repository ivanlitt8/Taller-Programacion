//  Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con 
//  las entradas vendidas. Se desea procesar la información de una semana.
//  Implementar un programa que:

//     1. Genere 7 listas con las entradas vendidas para cada día. De cada entrada se lee
//      día (de 1 a 7), código de la obra, asiento y monto. La lectura finaliza con el 
//      código de obra igual a 0. Las listas deben estar ordenadas por código de obra de
//      forma ascendente.

//     2. Genere una nueva lista que totalice la cantidad de entradas vendidas por obra.
//      Esta lista debe estar ordenada por código de obra de forma ascendente.

Program ejercicio4;

Const 
  dimF = 7;

Type 
  rango = 1..dimF;

  entrada = Record
    dia: rango;
    cod: Integer;
    asiento: integer;
    monto: real;
  End;
  lista = ^nodo;
  nodo = Record
    data: entrada;
    sig: lista;
  End;

  info = Record
    total: integer;
    codigo: integer;
  End;

  listaMerge = ^nodoM;
  nodoM = Record
    data: info;
    sig: listaMerge;
  End;

  vectDias = array [rango] Of lista;

Procedure cargarVector (Var V:vectDias);

Procedure iniacializVect(Var V:vectDias);

Var 
  i: integer;
Begin
  For i:= 1 To dimF Do
    V[i] := Nil;
End;

Procedure leerEntrada(Var E:entrada);
Begin
  writeLn('Codigo Funcion: ');
  ReadLn(E.cod);
  If (E.cod<>0)Then
    Begin
      writeLn('Dia de Funcion (1 a 7): ');
      ReadLn(E.dia);
      writeLn('Asiento Asignado: ');
      ReadLn(E.asiento);
      writeLn('Monto de Entrada: ');
      ReadLn(E.monto);
    End;
End;

Procedure insertarOrdenado (Var L:lista; E:entrada);

Var 
  nue: lista;
  act,ant: lista;
Begin
  new(nue);
  nue^.data := E;
  act := L;
  ant := L;
  While (act<>Nil) And (E.cod < act^.data.cod ) Do
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
  E: entrada;
Begin
  iniacializVect(V);
  leerEntrada(E);
  While (E.cod<>0) Do
    Begin
      insertarOrdenado(V[E.dia],E);
      leerEntrada(E);
    End;
End;


Procedure merge(V:vectDias; Var L:listaMerge);

Procedure agregarListaMerge(Var L:listaMerge; codigo,cantidad:integer);

Var 
  act,ant,nue: listaMerge;
Begin
  new(nue);
  nue^.data.codigo := codigo;
  nue^.data.total := cantidad;
  act := L;
  ant := L;
  While (act <> Nil) And (act^.data.codigo < codigo) Do
    Begin
      ant := act;
      act := act^.sig;
    End;

  If (act = L) Then
    L := nue
  Else
    ant^.sig := nue;
  nue^.sig := act;
End;

Procedure minimo (Var V:vectDias; Var min:integer);

Var 
  indiceMin, i: rango;
Begin
  min := 999;
  For i:=1 To dimF Do
    If (V[i] <> Nil) Then
      If (V[i]^.data.cod < min) And  (V[i]^.data.cod <= min) Then
        Begin
          indiceMin := i;
          min := V[i]^.data.cod;
        End;

  If (min <> 999) Then
    V[indiceMin] := V[indiceMin]^.sig;
End;


Var 
  actual,minCod,cant: integer;
Begin
  L := Nil;
  cant := 0;
  minimo(V,minCod);
  While (minCod<>999) Do
    Begin
      actual := minCod;
      cant := 0;
    End;
  While (minCod<>999) And (actual = minCod) Do
    Begin
      cant := cant + 1;
      minimo(V, minCod);
    End;
  agregarListaMerge(L, actual, cant);
End;



Procedure imprimirLista (L:listaMerge);
Begin
  If (L<>Nil)Then
    Begin
      WriteLn('--------------');
      WriteLn('Pelicula Codigo: ',L^.data.codigo,', cantidad de entradas: ',L^.data.total);
      WriteLn('--------------');
      imprimirLista(L^.sig);
    End;
End;


Var 
  V: vectDias;
  Lm: listaMerge;
Begin
  cargarVector(V);
  merge(V,Lm);
  imprimirLista(Lm);
End.
