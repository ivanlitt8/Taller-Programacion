// 3.	Implementar un programa que contenga:

// a. Un módulo que lea información de alumnos de Taller de Programación y almacene en una 
//     estructura de datos sólo a aquellos alumnos que posean año de ingreso posterior al 2010.
//     De cada alumno se lee legajo, DNI y año de ingreso. La estructura generada debe ser 
//     eficiente para la búsqueda por número de legajo. 

// b. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de
//     aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro. 

// c. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de
//     aquellos alumnos cuyo legajo esté comprendido entre dos valores que se reciben como
//     parámetro. 

// d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.

// e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
//     legajo impar.

Program ejercicio3;

Type 

  alumno = Record
    leg: Integer;
    dni: Integer;
    anio: Integer;
  End;

  arbol = ^nodo;
  nodo = Record
    data: alumno;
    hd: arbol;
    hi: arbol;
  End;

Procedure cargarArbol (Var A: arbol);

Procedure leerAlumno (Var Alu: alumno);
Begin
  WriteLn('Ingrese anio de ingreso:');
  Read(Alu.anio);
  If (Alu.anio > 2010) Then
    Begin
      WriteLn('Ingrese dni alumno:');
      ReadLn(Alu.dni);
      WriteLn('Ingrese legajo de alumno:');
      ReadLn(Alu.leg);
    End
  Else
    leerAlumno(Alu);
End;

Procedure cargarAlumno ( Var A: arbol; alu:alumno);
Begin
  If (A=Nil)Then
    Begin
      new(A);
      A^.data := alu;
      A^.hi := Nil;
      A^.hd := Nil;
    End
  Else
    Begin
      If (alu.leg < A^.data.leg)Then
        cargarAlumno(A^.hi,alu)
      Else
        cargarAlumno(A^.hd,alu);
    End;
End;

Var 
  alu: alumno;
Begin
  leerAlumno(alu);
  While (alu.leg<>-1) Do
    Begin
      cargarAlumno(A,alu);
      leerAlumno(alu);
    End;
End;

Procedure buscarLegajos(A:arbol);

Procedure imprimir(A:arbol);
Begin
  If (A<>Nil)Then
    Begin
      WriteLn('Legajo: ',A^.data.leg);
      WriteLn('Dni: ',A^.data.dni);
      WriteLn('Ingreso: ',A^.data.anio);
      WriteLn('-------------');
      imprimir(A^.hi);
      imprimir(A^.hd);
    End;
End;

Procedure  alumnosLegajo(A:arbol;legajo:Integer);
Begin
  If (A<>Nil) Then
    Begin
      If (A^.data.leg > legajo) Then
        alumnosLegajo(A^.hi,legajo)
      Else
        Begin
          imprimir(A^.hi);
          WriteLn('Dni: ',A^.data.dni);
          WriteLn('Ingreso: ',A^.data.anio);
          WriteLn('-------------');
          alumnosLegajo(A^.hd,legajo);
        End;
    End;
End;

Procedure alumnosIntervalo(A: arbol; val1,val2: integer);
Begin
  If (A<>Nil)Then
    Begin
      If (A^.data.leg < val1) Then
        alumnosIntervalo(A^.hd,val1,val2)
      Else If (A^.data.leg > val2) Then
             alumnosIntervalo(A^.hi,val1,val2)
      Else If ((A^.data.leg > val1) And (A^.data.leg < val2)) Then
             Begin
               WriteLn('Dni: ',A^.data.dni);
               WriteLn('Ingreso: ',A^.data.anio);
               WriteLn('-------------');
               alumnosIntervalo(A^.hi,val1,val2);
               alumnosIntervalo(A^.hd,val1,val2);
             End;
    End
End;

Var 
  legajo,val1,val2: integer;
Begin
  WriteLn('Ingrese numero de legajo' );
  ReadLn(legajo);
  alumnosLegajo(A,legajo);
  WriteLn('Ingrese valor de primer valor' );
  ReadLn(val1);
  WriteLn('Ingrese valor de segundo valor' );
  ReadLn(val2);
  alumnosIntervalo(A,val1,val2);
End;

Function buscarDniMax(A:arbol): integer;

Var 
  maxI,maxD,aux: integer;
Begin
  If (A=Nil)Then
    buscarDniMax := -1
  Else
    Begin
      maxI := buscarDniMax(A^.hi);
      maxD := buscarDniMax(A^.hd);
      If (maxI>maxD) Then
        aux := maxI
      Else
        aux := maxD;
      If (aux > A^.data.dni) Then
        buscarDniMax := aux
      Else
        buscarDniMax := A^.data.dni;
    End;
End;

Function cantLegImpar(A:arbol): integer;

Function esImpar(num: integer): Boolean;
Begin
  esImpar := (num Mod 2<>0);
End;

Begin
  If (A = Nil) Then
    cantLegImpar := 0
  Else
    If esImpar(A^.data.leg) Then
      cantLegImpar := (cantLegImpar(A^.hi) + cantLegImpar(A^.hd) + 1);
End;

Var 
  A: arbol;
Begin
  cargarArbol(A);
  buscarLegajos(A);
  WriteLn('El DNI maximo es: ',buscarDniMax(A));
  WriteLn('La cantidad de alumnos con legajo impar es : ',cantLegImpar(A));
End.
