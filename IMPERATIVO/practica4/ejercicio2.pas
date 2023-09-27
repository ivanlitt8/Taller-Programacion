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
// h. Un módulo recursivo que reciba la estructura generada en g. y muestre su contenido.
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

  contador = Record
    ISBN: integer;
    cant: integer;
  End;

  arbolC = ^nodo4;
  nodo4 = Record
    data: contador;
    HI: arbolC;
    HD: arbolC;
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
  If (L<>Nil) Then
    Begin
      WriteLn('***************************');
      WriteLn('ISBN de libro: ',L^.data.ISBN);
      WriteLn('***************************');
      While (L<>Nil) Do
        Begin
          WriteLn('Numero de socio: ',L^.data.numS);
          WriteLn('Dia de prestamo: ',L^.data.dia);
          WriteLn('Mes de prestamo: ',L^.data.mes);
          WriteLn('Cantidad de dias de prestamo: ',L^.data.cantD);
          L := L^.sig;
        End;
    End
  Else
    writeln('Lista de prestamos vacia');
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

Function buscarMax(A:arbolI): integer;
Begin
  If (A^.HD<>Nil) Then
    Begin
      buscarMax := buscarMax(A^.HD);
    End
  Else
    buscarMax := A^.data.ISBN;
End;

Procedure MaxISBN(A: arbolI);
Begin
  If (A<>Nil) Then
    writeln('El ISBN mas grande es: ',buscarMax(A))
  Else
    writeln('El arbol esta vacio.');
End;

Function buscarMin(A:arbolP): integer;
Begin
  If (A^.HI<>Nil) Then
    Begin
      buscarMin := buscarMin(A^.HI);
    End
  Else
    buscarMin := A^.data.ISBN;
End;

Procedure MinISBN(A:arbolP);
Begin
  If (A<>Nil) Then
    writeln('El ISBN mas pequeno es: ',buscarMin(A))
  Else
    writeln('El arbol esta vacio.');
End;

Function cantPrestamosAI(A: arbolI; num:integer): integer;
Begin
  If (A<>Nil) Then
    Begin
      If (A^.data.numS <> num) Then
        Begin
          cantPrestamosAI := cantPrestamosAI(A^.HI,num) + cantPrestamosAI(A^.HD,num);
        End
      Else
        cantPrestamosAI := cantPrestamosAI(A^.HI,num) + cantPrestamosAI(A^.HD,num) + 1
    End
  Else
    cantPrestamosAI := 0;
End;

Procedure prestamosDeSocioAI(A: arbolI);

Var 
  num: integer;
Begin
  Write('Ingrese numero de socio: ');
  ReadLn(num);
  Write('El socio tiene ',cantPrestamosAI(A,num),' prestamos');
End;

Function contar(L:lista; num: integer): integer;

Var 
  cont: integer;
Begin
  cont := 0;
  While (L<>Nil) Do
    Begin
      If (L^.data.numS = num) Then
        cont := cont + 1;
      L := L^.sig;
    End;
  contar := cont;
End;

Procedure cantPrestamosAP(A:arbolP ; num: integer; Var total: Integer);
Begin
  If (A<>Nil) Then
    Begin
      total := total + contar(A^.data.prestamos,num);
      cantPrestamosAP(A^.HI,num,total);
      cantPrestamosAP(A^.HD,num,total);
    End;
End;

Procedure prestamosDeSocioAP(A: arbolP);

Var 
  num,cant: integer;
Begin
  cant := 0;
  Write('Ingrese numero de socio: ');
  ReadLn(num);
  cantPrestamosAP(A,num,cant);
  Write('El socio tiene ',cant,' prestamos');
End;

Procedure agregarArbolCont(Var A:arbolC; ISBN:integer);
Begin
  If (A=Nil)Then
    Begin
      new(A);
      A^.data.cant := 1;
      A^.data.ISBN := ISBN;
      A^.HI := Nil;
      A^.HD := Nil;
    End
  Else
    Begin
      If (A^.data.ISBN = ISBN) Then
        A^.data.cant := A^.data.cant + 1
      Else If (A^.data.ISBN < ISBN) Then
             agregarArbolCont(A^.HD,ISBN)
      Else
        agregarArbolCont(A^.HI,ISBN);
    End;
End;

Procedure contadorISBN(AI: arbolI ; Var AC: arbolC);
Begin
  If (AI<>Nil) Then
    Begin
      contadorISBN(AI^.HI,AC);
      contadorISBN(AI^.HD,AC);
      agregarArbolCont(AC,AI^.data.ISBN);
    End;
End;

Procedure imprimirArbolContador (A: arbolC);
Begin
  If (A<>Nil) Then
    Begin
      imprimirArbolContador(A^.HI);
      imprimirArbolContador(A^.HD);
      WriteLn('Libro ISBN: ',A^.data.ISBN,' tiene ',A^.data.cant,' prestamos.');
    End;
End;

Procedure agregarArbolContPrestamos(Var A:arbolC; ISBN,cont: integer);
Begin
  If (A = Nil) Then
    Begin
      new(A);
      A^.data.cant := cont;
      A^.data.ISBN := ISBN;
      A^.HI := Nil;
      A^.HD := Nil;
    End
  Else
    Begin
      If (A^.data.ISBN = ISBN) Then
        A^.data.cant := A^.data.cant + 1
      Else If (A^.data.ISBN < ISBN) Then
             agregarArbolContPrestamos(A^.HD,ISBN,cont)
      Else
        agregarArbolContPrestamos(A^.HI,ISBN,cont);
    End;
End;

Function recorrerLista(L:lista): integer;
Begin
  If (L<>Nil) Then
    recorrerLista := recorrerLista(L^.sig) + 1
  Else
    recorrerLista := 0;
End;

Procedure contadorPrestamo(A:arbolP; Var AC: arbolC);
Begin
  If (A<>Nil) Then
    Begin
      agregarArbolContPrestamos(AC,A^.data.ISBN, recorrerLista(A^.data.prestamos));
      contadorPrestamo(A^.HI,AC);
      contadorPrestamo(A^.HD,AC);
    End;
End;

Function contarEntreValoresAI(A:arbolI; cod1,cod2: Integer): integer;
Begin
  If (A<>Nil) Then
    Begin
      If (A^.data.ISBN >= cod1) Then
        Begin
          If (A^.data.ISBN <= cod2) Then
            contarEntreValoresAI := contarEntreValoresAI(A^.HD,cod1,cod2) + contarEntreValoresAI(A^.HI,cod1,cod2) + 1
          Else
            contarEntreValoresAI := contarEntreValoresAI(A^.HI,cod1,cod2)
        End
      Else
        contarEntreValoresAI := contarEntreValoresAI(A^.HD,cod1,cod2)
    End
  Else
    contarEntreValoresAI := 0;
End;

Procedure cantidadEntreValoresAI(A: arbolI);

Var 
  cod1,cod2,aux: Integer;
Begin
  Write('Ingrese ISBN uno: ');
  ReadLn(cod1);
  Write('Ingrese ISBN dos: ');
  ReadLn(cod2);
  If (cod1>cod2) Then
    Begin
      aux := cod1;
      cod1 := cod2;
      cod2 := aux;
    End;
  WriteLn('Hay ',contarEntreValoresAI(A,cod1,cod2),' libros entre los ISBN ingresados.');
End;

Function contarEnLista(L:lista): integer;
Begin
  If (L<>Nil)Then
    Begin
      contarEnLista := contarEnLista(L^.sig) + 1;
    End
  Else
    contarEnLista := 0;
End;

Function contarEntreValoresAP(A:arbolP; cod1,cod2: integer): Integer;
Begin
  If (A<>Nil) Then
    Begin
      If (A^.data.ISBN >= cod1) Then
        Begin
          If (A^.data.ISBN <= cod2) Then
            contarEntreValoresAP := contarEntreValoresAP(A^.HD,cod1,cod2) + contarEntreValoresAP(A^.HI,cod1,cod2) +
                                    contarEnLista(A^.data.prestamos)
          Else
            contarEntreValoresAP := contarEntreValoresAP(A^.HI,cod1,cod2)
        End
      Else
        contarEntreValoresAP := contarEntreValoresAP(A^.HD,cod1,cod2)
    End
  Else
    contarEntreValoresAP := 0;
End;

Procedure cantidadEntreValoresAP(A: arbolP);

Var 
  cod1,cod2,aux: Integer;
Begin
  Write('Ingrese ISBN uno: ');
  ReadLn(cod1);
  Write('Ingrese ISBN dos: ');
  ReadLn(cod2);
  If (cod1>cod2) Then
    Begin
      aux := cod1;
      cod1 := cod2;
      cod2 := aux;
    End;
  WriteLn('Hay ',contarEntreValoresAP(A,cod1,cod2),' libros entre los ISBN ingresados.');
End;

Var 
  AI: arbolI;
  AP: arbolP;
  AC1,AC2: arbolC;
Begin
  cargarArboles(AI,AP);
  // imprimirArbolISBN(AI);
  // imprimirArbolPrestamos(AP);
  // MaxISBN(AI);
  // MinISBN(AP);
  // prestamosDeSocioAI(AI);
  // prestamosDeSocioAP(AP);
  // contadorISBN(AI,AC1);
  // imprimirArbolContador(AC1);
  // contadorPrestamo(AP,AC2);
  // imprimirArbolContador(AC2);
  // cantidadEntreValoresAI(AI);
  cantidadEntreValoresAP(AP);
End.
