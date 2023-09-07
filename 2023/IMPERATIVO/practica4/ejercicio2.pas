// Una biblioteca nos ha encargado procesar la información de los préstamos realizados
// durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
// y mes del préstamo y cantidad de días prestados. Implementar un programa con:

// a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
// los préstamos. La lectura de los préstamos finaliza con ISBN -1. Las estructuras deben
// ser eficientes para buscar por ISBN.

// i. En una estructura cada préstamo debe estar en un nodo.

// ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
// (prestar atención sobre los datos que se almacenan).

// b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
// grande.
// c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
// pequeño.
// d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
// módulo debe retornar la cantidad de préstamos realizados a dicho socio.
// e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
// módulo debe retornar la cantidad de préstamos realizados a dicho socio.
// f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
// ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
// que se prestó.
// g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
// ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
// que se prestó.
// h. Un módulo recursivo que reciba la estructura generada en h. y muestre su contenido.
// i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
// módulo debe retornar la cantidad total de préstamos realizados a los ISBN
// comprendidos entre los dos valores recibidos (incluidos).
// j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
// módulo debe retornar la cantidad total de préstamos realizados a los ISBN
// comprendidos entre los dos valores recibidos (incluidos).

Program ejercicio2;

Type 

  rangoDia = 1..31;
  rangoMes = 1..12;

  prestamo = Record
    ISBN: Integer;
    numS: integer;
    dia: rangoDia;
    mes: rangoMes;
    cantD: integer;
  End;

  arbolI = ^nodo1;
  nodo1 = Record
    data: prestamo;
    HI: arbolI;
    HD: arbolI;
  End;

  lista = ^nodo2;
  nodo2 = Record
    data: prestamo;
    sig: lista;
  End;

  listado = Record
    ISBN: integer;
    prestamos: lista;
  End;

  arbolP = ^nodo3;
  nodo3 = Record
    data: listado;
    HI: arbolP;
    HD: arbolP;
  End;

Procedure leerPrestamo(Var P: prestamo);
Begin
  write('Ingrese ISBN: ');
  ReadLn(P.ISBN);
  If (P.ISBN <> -1) Then
    Begin
      write('Ingrese numero de socio: ');
      ReadLn(P.numS);
      write('Ingrese dia de prestamo: ');
      ReadLn(P.dia);
      write('Ingrese mes de prestamo: ');
      ReadLn(P.mes);
      write('Ingrese cantidad de dias: ');
      ReadLn(P.cantD);
      WriteLn('+++  PRESTAMO CARGADO  +++');
    End;
End;

Procedure agregarListaPrestamos(Var L:lista ; P:prestamo);

Var 
  nue: lista;
Begin
  new(nue);
  nue^.data := P;
  nue^.sig := L;
  L := nue;
End;

Procedure agregarArbolPrestamos(Var A: arbolP; P: prestamo);

Begin
  If (A = Nil) Then
    Begin
      new(A);
      A^.data.ISBN := P.ISBN;
      A^.data.prestamos := Nil;
      A^.HI := Nil;
      A^.HD := Nil;
      agregarListaPrestamos(A^.data.prestamos,P);
    End
  Else
    Begin
      If (P.ISBN = A^.data.ISBN) Then
        agregarListaPrestamos(A^.data.prestamos,P)
      Else If (P.ISBN < A^.data.ISBN) Then
             agregarArbolPrestamos(A^.HI,P)
      Else
        agregarArbolPrestamos(A^.HD,P);
    End;
End;

Procedure agregarArbolISBN(Var A: arbolI; P: prestamo);

Begin
  If (A = Nil) Then
    Begin
      new(A);
      A^.data := P;
      A^.HI := Nil;
      A^.HD := Nil;
    End
  Else If (P.ISBN <= A^.data.ISBN) Then
         agregarArbolISBN(A^.HI,P)
  Else
    agregarArbolISBN(A^.HD,P);
End;

Procedure cargarArboles(Var AI: arbolI ; Var AP: arbolP);

Var 
  P: prestamo;
Begin
  leerPrestamo(P);
  While (P.ISBN<>-1) Do
    Begin
      agregarArbolISBN(AI,P);
      agregarArbolPrestamos(AP,P);
      leerPrestamo(P);
    End;
End;

Procedure imprimirArbolISBN(A: arbolI);
Begin
  If (A<>Nil) Then
    Begin
      imprimirArbolISBN(A^.HI);
      WriteLn('ISBN de libro: ',A^.data.ISBN);
      WriteLn('Numero de socio: ',A^.data.numS);
      WriteLn('Dia de prestamo: ',A^.data.dia);
      WriteLn('Mes de prestamo: ',A^.data.mes);
      WriteLn('Cantidad de dias de prestamo: ',A^.data.cantD);
      WriteLn('------------------------');
      imprimirArbolISBN(A^.HD);
    End;
End;

Procedure imprimirLista(L: lista);
Begin
  While (L<>Nil) Do
    Begin
      WriteLn('ISBN de libro: ',L^.data.ISBN);
      WriteLn('Numero de socio: ',L^.data.numS);
      WriteLn('Dia de prestamo: ',L^.data.dia);
      WriteLn('Mes de prestamo: ',L^.data.mes);
      WriteLn('Cantidad de dias de prestamo: ',L^.data.cantD);
      L := L^.sig;
    End;
  WriteLn('***************************');
End;

Procedure imprimirArbolPrestamos(A: arbolP);
Begin
  If (A<>Nil) Then
    Begin
      imprimirArbolPrestamos(A^.HI);
      imprimirLista(A^.data.prestamos);
      imprimirArbolPrestamos(A^.HD);
    End;
End;

Var 
  AI: arbolI;
  AP: arbolP;
Begin
  cargarArboles(AI,AP);
  imprimirArbolISBN(AI);
  imprimirArbolPrestamos(AP);
End.
