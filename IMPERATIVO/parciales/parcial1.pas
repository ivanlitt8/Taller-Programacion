// Una empresa desea procesa la info de las hs trabajadas por sus empleados durante 2021.
// Para ello, la empresa posee registros de las horas trabajadas por cada por cada empleado.
// Cada registro consta del numero de empleado, dia, mes y cantidad de horas trabajadas
// (a lo sumo 8) para dicho dia y mes.

// a) Realizar un modulo que lea la info de los empleados y retorne estructura de datos con
//  todos los registros leidos. La estructura debe ser eficiente para la busqueda por numero de
//  empleado. La lectura finaliza al infresa un registro con dia 0. Se sugiere utilizar el modulo
//  leerRegistro().

// b) Realizar un modulo que reciba la estructura genera en a) y dos numeros de empleado X e Y, 
//  y retorne todos los registros de horas trabajadas por empleados cuyos numeros esten entre X 
//  e Y (incluidos).

// c) Realizar un modulo recursivo que reciba la estructura generada en b) y retorne la cantidad
//  total de horas trabajadas.

Program parcial1;

Type 
  rangoDia = 0..31;
  rangoMes = 1..12;
  rangoHs = 0..8;

  registro = Record
    numE: integer;
    dia: rangoDia;
    mes: rangoMes;
    cant: rangoHs;
  End;

  lista = ^nodo1;
  nodo1 = Record
    data: registro;
    sig: lista;
  End;

  empleado = Record
    listaHs: lista;
    numE: integer;
  End;

  arbol = ^nodo2;
  nodo2 = Record
    data: empleado;
    HI: arbol;
    HD: arbol;
  End;

Procedure leerRegistro(Var R: registro);
Begin
  write('Ingrese dia: ');
  ReadLn(R.dia);
  If (R.dia<>0) Then
    Begin
      write('Ingrese numero de empleado: ');
      ReadLn(R.numE);
      write('Ingrese mes: ');
      ReadLn(R.mes);
      write('Ingrese cantidad de horas: ');
      ReadLn(R.cant);
      writeLn('  ++ REGISTRO LEIDO ++  ');
    End;
End;

Procedure agregarAlista(Var L: lista; R: registro);

Var 
  nue: lista;
Begin
  new(nue);
  nue^.data := R;
  nue^.sig := L;
  L := nue;
End;

Procedure agregarRegistro(Var A: arbol; R: registro);
Begin
  If (A=Nil)Then
    Begin
      new(A);
      A^.data.listaHs := Nil;
      A^.data.numE := R.numE;
      agregarAlista(A^.data.listaHs,R);
    End
  Else
    Begin
      If (A^.data.numE = R.numE) Then
        agregarAlista(A^.data.listaHs,R)
      Else
        Begin
          If (A^.data.numE<R.numE) Then
            agregarRegistro(A^.HD,R)
          Else
            agregarRegistro(A^.HI,R);
        End;
    End;
End;

Procedure cargarArbol(Var A:arbol);

Var 
  R: registro;
Begin
  leerRegistro(R);
  While (R.dia<>0) Do
    Begin
      agregarRegistro(A,R);
      leerRegistro(R);
    End;
End;

Procedure imprimirListaEmpleado(L:lista);
Begin
  While (L<>Nil) Do
    Begin
      writeLn('Dia: ',L^.data.dia);
      WriteLn('Numero de empleado: ',L^.data.numE);
      writeLn('Mes: ',L^.data.numE);
      writeln('Cantidad de horas: ',L^.data.cant);
      writeln(' ----------------- ');
      L := L^.sig;
    End;
End;

Procedure imprimirArbol(A: arbol);
Begin
  If (A<>Nil) Then
    Begin
      imprimirArbol(A^.HI);
      imprimirListaEmpleado(A^.data.listaHs);
      imprimirArbol(A^.HD);
    End;
End;

Procedure agregarArbol(L: lista; numE: integer ; Var A:arbol);
Begin
  If (A = Nil)Then
    Begin
      new(A);
      A^.data.listaHs := L;
      A^.data.numE := numE;
    End
  Else
    Begin
      If (A^.data.numE<numE) Then
        agregarArbol(L,numE,A^.HD)
      Else
        agregarArbol(L,numE,A^.HI);
    End;
End;

Procedure cargarListado(A: arbol; cod1,cod2:integer; Var AN: arbol);
Begin
  If (A<>Nil) Then
    Begin
      If (A^.data.numE >= cod1) Then
        Begin
          If (A^.data.numE <= cod2) Then
            Begin
              cargarListado(A^.HI,cod1,cod2,AN);
              cargarListado(A^.HD,cod1,cod2,AN);
              agregarArbol(A^.data.listaHs,A^.data.numE,AN);
            End
          Else
            cargarListado(A^.HI,cod1,cod2,AN);
        End
      Else
        cargarListado(A^.HD,cod1,cod2,AN);
    End;
End;

Procedure retornarRegistroHS(A: arbol; Var AN:arbol);

Var 
  X,Y,aux: integer;
Begin
  Write('Ingrese codigo de empleado X: ');
  ReadLn(X);
  Write('Ingrese codigo de empleado Y: ');
  ReadLn(Y);
  If (X>Y) Then
    Begin
      aux := Y;
      Y := X;
      X := aux;
    End;
  cargarListado(A,X,Y,AN);
  imprimirArbol(AN);
End;

Function contarHs(L: lista): integer;

Var 
  total: integer;
Begin
  total := 0;
  While (L<>Nil) Do
    Begin
      total := total + L^.data.cant;
      L := L^.sig;
    End;
  contarHs :=  total;
End;

Function totalHs(A: arbol): integer;
Begin
  If (A<>Nil) Then
    totalHs := totalHs(A^.HI) + totalHs(A^.HD) + contarHs(A^.data.listaHs)
  Else
    totalHS := 0;
End;

Var 
  A,AN: arbol;
Begin
  A := Nil;
  AN := Nil;
  cargarArbol(A);
  imprimirArbol(A);
  retornarRegistroHS(A,AN);
  writeln('El total de horas trabajadas es: ',totalHs(AN));
End.
