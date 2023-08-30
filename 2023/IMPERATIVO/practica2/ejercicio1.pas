// Implementar un programa que invoque a los siguientes módulos.
// a. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto, los
// almacene en un vector con dimensión física igual a 10 y retorne el vector.
// b. Un módulo que reciba el vector generado en a) e imprima el contenido del vector.
// c. Un módulo recursivo que reciba el vector generado en a) e imprima el contenido del vector..
// d. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
// retorne la cantidad de caracteres leídos. El programa debe informar el valor retornado.
// e. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
// retorne una lista con los caracteres leídos.
// f. Un módulo recursivo que reciba la lista generada en e) e imprima los valores de la lista en el
// mismo orden que están almacenados.
// g. Implemente un módulo recursivo que reciba la lista generada en e) e imprima los valores de
// la lista en orden inverso al que están almacenados.

Program ejercicio1;

Const 
  dimF = 10;

Type 
  rango = 1..dimF;

  vectorCadena = array [rango] Of char;

  lista = ^nodo;
  nodo = Record
    data: char;
    sig: lista;
  End;

Procedure leerCaracter(Var C:char);
Begin
  Write('Ingrese caracter: ');
  readln(C);
End;

Procedure cargarCadena(Var V:vectorCadena; Var dimL: integer );

Var 
  C: char;
Begin
  leerCaracter(C);
  If (dimL<dimF)And(C<>'.') Then
    Begin
      dimL := dimL + 1;
      V[dimL] := C;
      cargarCadena(V,dimL);
    End;
End;

Procedure imprecionIterativa(V:vectorCadena; dimL: integer );

Var 
  i: integer;
Begin
  For i:= 1 To dimL Do
    WriteLn(V[i]);
End;

Procedure imprecionRecursiva(V:vectorCadena ; dimL: integer; Var cont: integer);
Begin
  If (cont<dimL) Then
    Begin
      cont := cont + 1;
      WriteLn(V[cont]);
      imprecionRecursiva(V,dimL,cont);
    End;
End;

Procedure leerSecuenciaRecursiva(Var cant: integer);

Var 
  C: char;
Begin
  leerCaracter(C);
  If (C<>'.')Then
    Begin
      cant := cant + 1;
      leerSecuenciaRecursiva(cant);
    End;
End;

Procedure agregarFinal (Var L, ult: lista; C: char);

Var 
  nue: lista;
Begin
  new(nue);
  nue^.data := C;
  nue^.sig := Nil;
  If ( L = Nil ) Then
    L := nue
  Else
    ult^.sig := nue;
  ult := nue;
End;

Procedure cargarListaRecursiva(Var L, ult:lista; Var C: char);

Begin
  If (C<>'.')Then
    Begin
      agregarFinal(L,ult,C);
      leerCaracter(C);
      cargarListaRecursiva(L,ult,C);
    End;
End;

Procedure impresionRecursivaLista(L: lista);
Begin
  If (L<>Nil) Then
    Begin
      writeln(L^.data);
      L := L^.sig;
      impresionRecursivaLista(L);
    End;
End;

Procedure imprimirListaInversa (L:lista);
Begin
  If (L<>Nil) Then
    Begin
      imprimirListaInversa(L^.sig);
      writeln(L^.data);
    End
End;

Var 
  dimL,cont,cant: integer;
  V: vectorCadena;
  V2: vectorCadena;
  L,ult: lista;
  C: char;
Begin
  dimL := 0;
  cargarCadena(V,dimL);
  imprecionIterativa(V,dimL);
  cont := 0;
  imprecionRecursiva(V,dimL,cont);
  cant := 0;
  leerSecuenciaRecursiva(cant);
  WriteLn('Se leyeron ',cant,' caracteres');
  L := Nil;
  leerCaracter(C);
  cargarListaRecursiva(L,ult,C);
  impresionRecursivaLista(L);
  imprimirListaInversa(L);
End.
