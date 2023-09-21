
Program parcialTaller;

Type 

  rangoDias = 0..31;
  rangoDiag = 1..15;

  atencion = Record
    dia: rangoDias;
    dni: integer;
    matric: integer;
    codD: rangoDiag;
  End;

  arbol = ^nodo;
  nodo = Record
    data: atencion;
    HI: arbol;
    HD: arbol;
  End;

  vector = array[1..31] Of arbol;

Procedure inicializVect(Var V: vector);

Var 
  i: integer;
Begin
  For i:= 1 To 31 Do
    V[i] := Nil;
End;

Procedure leerAtencion(Var A:atencion);
Begin
  Write('Ingrese dia de atencion: ');
  ReadLn(A.dia);
  If (A.dia<>0)Then
    Begin
      Write('Ingrese DNI de paciente: ');
      ReadLn(A.dni);
      Write('Ingrese matricula de doctor: ');
      ReadLn(A.matric);
      Write('Ingrese codigo de diagnostico: ');
      ReadLn(A.codD);
      Writeln(' ++ Atencion Leida ++ ');
    End;
End;

Procedure cargarAtencion(Var A:arbol; At: atencion);
Begin
  If (A=Nil)Then
    Begin
      new(A);
      A^.data := At;
      A^.HI := Nil;
      A^.HD := Nil;
    End
  Else
    Begin
      If (A^.data.dni < At.dni)Then
        cargarAtencion(A^.HD,At)
      Else
        cargarAtencion(A^.HI,At);
    End;
End;

Procedure cargarVector(Var V: vector);

Var 
  A: atencion;
Begin
  leerAtencion(A);
  While (A.dia<>0) Do
    Begin
      cargarAtencion(V[A.dia],A);
      leerAtencion(A);
    End;
End;

Procedure imprimirArbol(A:arbol);
Begin
  If (A<>Nil)Then
    Begin
      imprimirArbol(A^.HI);
      Writeln('Dia de atencion: ',A^.data.dia);
      Writeln('DNI de paciente: ',A^.data.dni);
      Writeln('Matricula de doctor: ',A^.data.matric);
      Writeln('Codigo de diagnostico: ',A^.data.codD);
      Writeln(' --------------- ');
      imprimirArbol(A^.HD);
    End;
End;

Procedure imprimir(V:vector);

Var 
  i: integer;
Begin
  For i:= 1 To 31 Do
    Begin
      If (V[i]<>Nil)Then
        imprimirArbol(V[i]);
    End;
End;

Function busqueda(A:arbol; dni: integer): Boolean;
Begin
  If (A<>Nil)Then
    Begin
      If (A^.data.dni=dni)Then
        busqueda := true
      Else
        Begin
          If (A^.data.dni > dni)Then
            busqueda(A^.HI,dni)
          Else
            busqueda(A^.HD,dni);
        End;
    End
  Else
    busqueda := false;
End;

Procedure verPacienteDia(V:vector; Var state:Boolean);

Var 
  dia,dni: integer;
Begin
  Write('Ingrese dia de atencion: ');
  ReadLn(dia);
  Write('Ingrese DNI de paciente: ');
  ReadLn(dni);
  state := busqueda(V[dia],dni);
  WriteLn(state);
End;

Function contar(A:arbol; Var cant: integer);
Begin
  If (A<>Nil)Then
    Begin
      cant := contar(A^.HI,cant) + contar(A^.HD,cant) + 1;
    End
  Else
    cant := 0;
End;


Procedure diaMaxAtenciones(V: vector);

Var 
  i,diaMax: integer;
  max,cant: integer;
Begin
  max := 0;
  cant := 0;
  For i:= 1 To 31 Do
    Begin
      If (max<contar(V[i]))Then
        Begin
          max := contar(V[i]);
          diaMax := i;
        End;
    End;
  WriteLn('El dia con maximas atenciones fue: ',diaMax);
End;

Var 
  V: vector;
  state: boolean;
Begin
  state := false;
  inicializVect(V);
  cargarVector(V);
  imprimir(V);
  verPacienteDia(V,state);
  diaMaxAtenciones(V);
End.
