// Una facultad nos ha encargado procesar la información de sus alumnos de la carrera XXX.
// Esta carrera tiene 30 materias. Implementar un programa con:

// a. Un módulo que lea la información de los finales rendidos por los alumnos y los
// almacene en dos estructuras de datos.

// i. Una estructura que para cada alumno se almacenen sólo código y nota de las
// materias aprobadas (4 a 10). 
// De cada final rendido se lee el código del alumno, el
// código de materia y la nota (valor entre 1 y 10). La lectura de los finales finaliza con
// nota -1. La estructura debe ser eficiente para buscar por código de alumno.

// ii. Otra estructura que almacene para cada materia, su código y todos los finales
// rendidos en esa materia (código de alumno y nota).

// b. Un módulo que reciba la estructura generada en i. y un código de alumno y retorne los
// códigos y promedios de los alumnos cuyos códigos sean mayor al ingresado.

// c. Un módulo que reciba la estructura generada en i., dos códigos de alumnos y un valor
// entero, y retorne la cantidad de alumnos con cantidad de finales aprobados igual al
// valor ingresado para aquellos alumnos cuyos códigos están comprendidos entre los dos
// códigos de alumnos ingresados.

Program ejercicio3;

Const 
  dimF = 30;

Type 

  rangoMat = 1..dimF;

  final = Record
    codA: integer;
    codM: integer;
    notaM: integer;
  End;

  listaFinales = ^nodo1;
  nodo1 = Record
    data: final;
    sig: listaFinales;
  End;

  alumno = Record
    codA: integer;
    finales: listaFinales;
  End;

  arbol = ^nodo2;
  nodo2 = Record
    data: alumno;
    HI: arbol;
    HD: arbol;
  End;

  vectorFinales = array [rangoMat] Of listaFinales;


Procedure leerFinal (Var F:final);
Begin
  write('Ingrese Nota: ');
  ReadLn(F.notaM);
  If (F.notaM<>-1) Then
    Begin
      write('Ingrese codigo de Alumno: ');
      ReadLn(F.codA);
      write('Ingrese codigo de Materia: ');
      ReadLn(F.codM);
      WriteLn('  +++++++ NOTA CARGADA +++++++  ');
    End;
End;

Procedure inicializVectFinales (Var V:vectorFinales);

Var 
  i: rangoMat;
Begin
  For i:= 1 To dimF Do
    V[i] := Nil;
End;

Procedure agregarListaFinales(Var L:listaFinales ; F: final);

Var 
  nue: listaFinales;
Begin
  new(nue);
  nue^.data := F;
  nue^.sig := L;
  L := nue;
End;

Procedure agregarFinalAlumno(Var A: arbol; F: final);
Begin
  If (A=Nil) Then
    Begin
      new(A);
      A^.data.codA := F.codA;
      A^.data.finales := Nil;
      A^.HI := Nil;
      A^.HD := Nil;
      If (F.notaM >= 4) And (F.notaM <= 10) Then
        agregarListaFinales(A^.data.finales,F);
    End
  Else
    Begin
      If (F.codA = A^.data.codA) Then
        Begin
          If ((F.notaM >= 4) And (F.notaM <= 10)) Then
            agregarListaFinales(A^.data.finales, F);
        End
      Else If (F.codA < A^.data.codA) Then
             agregarFinalAlumno(A^.HI, F)
      Else
        agregarFinalAlumno(A^.HD, F);
    End;
End;

Procedure cargarEstructuras(Var A: arbol; Var V:vectorFinales);

Var 
  F: final;
Begin
  leerFinal(F);
  While (F.notaM<>-1) Do
    Begin
      agregarListaFinales(V[F.codM],F);
      agregarFinalAlumno(A,F);
      leerFinal(F);
    End;
End;

Procedure imprimirLista (L:listaFinales);
Begin
  While (L<>Nil) Do
    Begin
      Writeln('Codigo de Alumno: ',L^.data.codA);
      Writeln('Codigo de Materia: ',L^.data.codM);
      Writeln('Nota: ',L^.data.notaM);
      WriteLn('-----------------');
      L := L^.sig;
    End;
End;

Procedure imprimirArbol (A: arbol);
Begin
  If (A<>Nil) Then
    Begin
      imprimirArbol(A^.HI);
      Writeln('Alumno codigo: ',A^.data.codA);
      WriteLn('  ******************  ');
      imprimirLista(A^.data.finales);
      imprimirArbol(A^.HD);
    End;
End;

Procedure imprimirVector(V: vectorFinales);

Var 
  i: rangoMat;
Begin
  For i:= 1 To dimF Do
    Begin
      If (V[i]<>Nil) Then
        While (V[i]<>Nil) Do
          Begin
            Writeln('Codigo de Alumno: ',V[i]^.data.codA);
            Writeln('Codigo de Materia: ',V[i]^.data.codM);
            Writeln('Nota: ',V[i]^.data.notaM);
            V[i] := V[i]^.sig;
          End;
    End;
End;

Function calcularPromedio (L: listaFinales): real;

Var 
  materias: integer;
  total: real;
Begin
  materias := 0;
  total := 0;
  While (L<>Nil) Do
    Begin
      materias := materias + 1;
      total := total + L^.data.notaM;
      L := L^.sig;
    End;
  If (materias>0) Then
    calcularPromedio := (total/materias)
  Else
    calcularPromedio := -1;
End;

Procedure imprimirDesdeCodBase(A: arbol; codBase: integer);
Begin
  If (A<>Nil) Then
    Begin
      If (codBase < A^.data.codA) Then
        Begin
          imprimirDesdeCodBase(A^.HI,codBase);
          imprimirDesdeCodBase(A^.HD,codBase);
          WriteLn('Alumno con codigo: ',A^.data.codA,' tiene promedio: ',calcularPromedio(A^.data.finales): 4: 2);
        End
      Else If (codBase >= A^.data.codA) Then
             imprimirDesdeCodBase(A^.HD,codBase);
    End;
End;

Procedure imprimirCodSuperiores(A: arbol);

Var 
  codbase: integer;
Begin
  Write('Ingrese codigo de alumno: ');
  ReadLn(codBase);
  imprimirDesdeCodBase(A,codBase);
End;

Function verificarCantidad(L: listaFinales; cant: integer): boolean;

Var 
  cont: integer;
Begin
  cont := 0;
  While (L<>Nil) Do
    Begin
      cont := cont + 1;
      L := L^.sig;
    End;
  verificarCantidad := (cont = cant);
End;

Function contarCantidad(A:arbol; cod1,cod2,num: integer): integer;
Begin
  If (A<>Nil) Then
    Begin
      WriteLn('  ----  ',A^.data.codA);
      If (A^.data.codA >= cod1) Then
        Begin
          If (A^.data.codA <= cod2) And (verificarCantidad(A^.data.finales,num)) Then
            Begin
              contarCantidad := contarCantidad(A^.HD,cod1,cod2,num) + contarCantidad(A^.HI,cod1,cod2,num) + 1;
            End
          Else
            contarCantidad := contarCantidad (A^.HI,cod1,cod2,num);
        End
      Else
        contarCantidad := contarCantidad (A^.HD,cod1,cod2,num)
    End
  Else
    contarCantidad := 0;
End;

Procedure contarEntreCodigos(A:arbol);

Var 
  aux,cant,cod1,cod2,num: integer;
Begin
  cant := 0;
  Write('Ingrese codigo uno: ');
  ReadLn(cod1);
  Write('Ingrese codigo dos: ');
  ReadLn(cod2);
  If (cod1>cod2) Then
    Begin
      aux := cod1;
      cod1 := cod2;
      cod2 := aux;
    End;
  Write('Ingrese numero de finales: ');
  ReadLn(num);
  WriteLn('Hay ',contarCantidad(A,cod1,cod2,num),
  ' alumnos con ',num,' finales aprobados entre los codigos ingresados.');
End;

Var 
  A: arbol;
  V: vectorFinales;
Begin
  inicializVectFinales(V);
  cargarEstructuras(A,V);
  imprimirArbol(A);
  //   imprimirVector(V);
  //   imprimirCodSuperiores(A);
  contarEntreCodigos(A);
End.
