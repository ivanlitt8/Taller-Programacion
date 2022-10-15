
Program ejercicio1;

Const 
  dimF = 12;

Type 
  rangoDia = 1..31;
  rangoMes = 1..dimF;
  prestamo = Record
    isbn: Integer;
    soc: Integer;
    dia: rangoDia;
    mes: rangoMes;
    cant: Integer;
  End;

  lista = ^nodo;
  nodo = Record
    data: prestamo;
    sig: lista;
  End;

  arbol = ^nodoA;
  nodoA = Record
    data: prestamo;
    hi: arbol;
    hd: arbol;
  End;

  info = Record
    isbn: Integer;
    cant: integer;
  End;

  listaMerge = ^nodoM;
  nodoM = Record
    data: info;
    sig: listaMerge;
  End;

  vectMes = array [rangoDia] Of lista;

Procedure inicializarVect (Var V:vectMes);

Var 
  i: Integer;
Begin
  For i:=1 To dimF Do
    V[i] := Nil;
End;

Procedure cargarVector (Var V:vectMes);

Procedure leerPrestamo (Var P:prestamo);
Begin
  WriteLn('Ingrese ISBN del libro: ');
  ReadLn(P.isbn);
  If (P.isbn<>-1) Then
    Begin
      WriteLn('Ingrese numero de socio: ');
      ReadLn(P.soc);
      WriteLn('Ingrese mes de prestamo: ');
      ReadLn(P.mes);
      WriteLn('Ingrese dia de prestamo: ');
      ReadLn(P.dia);
      WriteLn('Ingrese cantidad de dias prestado: ');
      ReadLn(P.cant);
    End;
End;


Procedure cargarPrestamo (Var L:lista; P:prestamo);

Var 
  nue: lista;
  act,ant: lista;
Begin
  new(nue);
  nue^.data := P;
  act := L;
  ant := L;
  While (act<>Nil) And (P.isbn < act^.data.isbn ) Do
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
  P: prestamo;
Begin
  leerPrestamo(P);
  While (P.isbn<>-1) Do
    Begin
      cargarPrestamo(V[P.mes],P);
      leerPrestamo(P);
    End;
End;

Procedure imprimirRecursivo(V:vectMes; i:Integer);

Procedure imprimirLista(L:lista);
Begin
  If (L<>Nil)Then
    Begin
      WriteLn('ISBN de libro: ',L^.data.isbn);
      WriteLn('Numero de socio de prestamo: ',L^.data.soc);
      WriteLn('------------------');
      imprimirLista(L^.sig);
    End;
End;

Begin
  If (i<=dimF)Then
    Begin
      WriteLn('---MES ',i,'---');
      imprimirLista(V[i]);
      imprimirRecursivo(V,i+1);
    End;
End;



Procedure recorrerVector(V:vectMes ; i:Integer; Var A:arbol);

Procedure   cargarPrestamo( Var A:arbol; P:prestamo);
Begin
  If (A=Nil)Then
    Begin
      new(A);
      A^.data := P;
      A^.hi := Nil;
      A^.hd := Nil;
    End
  Else
    Begin
      If (P.isbn < A^.data.isbn)Then
        cargarPrestamo(A^.hi,P)
      Else
        cargarPrestamo(A^.hd,P);
    End;
End;

Procedure recorrerLista(L:lista);
Begin
  If (L<>Nil)Then
    Begin
      cargarPrestamo(A,L^.data);
      recorrerLista(L^.sig);
    End;
End;

Begin
  If (i<dimF)Then
    Begin
      recorrerLista(V[i]);
      recorrerVector(V,i+1,A);
    End;
End;


Procedure imprimirArbol(A:arbol);
Begin
  If (A<>Nil)Then
    Begin
      WriteLn('----- ISBN numero: ',A^.data.isbn,'----- Socio numero: ',A^.data.soc);
      WriteLn('*********************************************');
      imprimirArbol(A^.hi);
      imprimirArbol(A^.hd);
    End;
End;


Procedure mergeListaISBN(V:vectMes;Var Lm:listaMerge);

Procedure seleccionarISBN (L:lista; V:vectMes; Var Lm:listaMerge);

Procedure recorrerListaMes(L:lista;isbnAct: integer; Var cant:integer);
Begin
  While (L<>Nil) Do
    Begin
      If (L^.data.isbn = isbnAct)Then
        cant := cant+1;
      L := L^.sig;
    End;
End;

Procedure insertarOrdenado (Var Lm:listaMerge; I:info);

Var 
  nue: listaMerge;
  act,ant: listaMerge;
Begin
  new(nue);
  nue^.data := I;
  act := Lm;
  ant := Lm;
  While (act<>Nil) And (I.isbn < act^.data.isbn ) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (act=ant) Then
    Lm := nue
  Else
    ant^.sig := nue;
  nue^.sig := act;
End;

Var 
  isbnAct: integer;
  i,cant: Integer;
  Inf: info;
Begin
  While (L<>Nil) Do
    Begin
      isbnAct := L^.data.isbn;
      cant := 0;
      For i:= 1 To dimF Do
        recorrerListaMes(V[i],isbnAct,cant);
      Inf.isbn := isbnAct;
      Inf.cant := cant;
      insertarOrdenado(Lm,Inf);
      L := L^.sig;
    End;
End;

Var 
  i: integer;
Begin
  Lm := Nil;
  For i:=1 To dimF Do
    Begin
      seleccionarISBN(V[i],V,Lm);
    End;
End;

Procedure ImprimirListaISBN(Lm:listaMerge);
Begin
  If (Lm<>Nil)Then
    Begin
      WriteLn('El libro con ISBN: ',Lm^.data.isbn,' tiene ',Lm^.data.cant,' prestamos en el anio 2021');
      imprimirListaISBN(Lm^.sig);
    End;

End;

Var 
  V: vectMes;
  i: Integer;
  A: arbol;
  Lm: listaMerge;
Begin
  i := 1;
  A := Nil;
  inicializarVect(V);
  cargarVector(V);
  //   imprimirRecursivo(V,i);
  recorrerVector(V,i,A);
  imprimirArbol(A);
  mergeListaISBN(V,Lm);
  ImprimirListaISBN(Lm);
End.
