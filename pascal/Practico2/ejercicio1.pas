
// f. Implemente un módulo recursivo que reciba la lista generada en e. e imprima los valores de la lista
// en el mismo orden que están almacenados.

// g. Implemente un módulo recursivo que reciba la lista generada en e. e imprima los valores de la lista 
// en orden inverso al que están almacenados.

Program ejercicio1;

Const 
  dimF = 10;

Type 
  rango = 1..dimF;
  vectS = array [rango] Of char;

  lista = ^nodo;
  nodo = Record
    data: char;
    sig: lista;
  End;


  //Punto A

Procedure leerCaracter(Var C: char);
Begin
  WriteLn('Ingrese caracter: ');
  ReadLn(C);
End;


Procedure leerSecuencia (Var V: vectS; Var dimL: integer );

Var 
  C: char;
Begin
  leerCaracter(C);
  If (C <> '.') And (dimL<dimF) Then
    Begin
      dimL := dimL+1;
      V[dimL] := C;
      leerSecuencia(V,dimL);
    End
  Else
    Writeln(' Se han cargado ',dimL,' caracteres.')  // Punto D
End;

//Punto C

Procedure imprecionRecursiva(V:vectS; dimL:integer);
Begin
  If (dimL<>0)Then
    Begin
      WriteLn(V[dimL]);
      imprecionRecursiva(V,(dimL-1));
    End;
End;

//Punto B

Procedure ImprecionNormal(V:vectS;dimL:integer);

Var 
  i: Integer;
Begin
  For i:=1 To dimL Do
    WriteLn('---',V[i],'---');
End;


Procedure cargarListaCaracteres( Var L:lista);

Procedure agregarAdelante (Var L:lista; C:char);

Var 
  nue: lista;
Begin
  new(nue);
  nue^.data := C;
  nue^.sig := L;
  L := nue;
End;

Var 
  C: char;
Begin
  leerCaracter(C);
  If (C<>'.')Then
    Begin
      agregarAdelante(L,C);
      cargarListaCaracteres(L);
    End;
End;


Procedure imprimirLista(L:lista);
Begin
  If (L<>Nil) Then
    Begin
      writeln('Caracter: ',L^.data);
      L := L^.sig;
      imprimirLista(L);
    End;
End;

Var 
  dimL: Integer;
  Vs: vectS;
  L: lista;
Begin
  dimL := 0;
  L := Nil;
  leerSecuencia(Vs,dimL);
  ImprecionNormal(Vs,dimL);
  imprecionRecursiva(Vs,dimL);
  cargarListaCaracteres(L);
  imprimirLista(L);
  imprimirListaInversa(L);

End.
