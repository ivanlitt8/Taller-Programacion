// 3. Implementar un programa que contenga:

// a. Un módulo que lea información de alumnos de Taller de Programación y los almacene en
// una estructura de datos. De cada alumno se lee legajo, DNI, año de ingreso y los códigos y
// notas de los finales rendidos. La estructura generada debe ser eficiente para la búsqueda por
// número de legajo. La lectura de los alumnos finaliza con legajo 0 y para cada alumno el ingreso
// de las materias finaliza con el código de materia -1.
// b. Un módulo que reciba la estructura generada en a. y retorne los DNI y año de ingreso de
// aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro.
// c. Un módulo que reciba la estructura generada en a. y retorne el legajo más grande.
// d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
// e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
// legajo impar.
// e. Un módulo que reciba la estructura generada en a. y retorne el legajo y el promedio del
// alumno con mayor promedio.
// f. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe
// retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.

Program ejercicio3;

Type 

  final = Record
    cod: integer;
    nota: integer;
  End;

  lista = ^nodo1;
  nodo1 = Record
    data: final;
    sig: lista;
  End;

  alumno = Record
    leg : integer;
    dni: integer;
    ing: integer;
    finales: lista;
  End;

  arbol = ^nodo2;
  nodo2 = Record
    data: alumno;
    HI: arbol;
    HD: arbol;
  End;

Procedure leerFinal(Var F:final);
Begin
  Write('Ingrese codigo de materia: ');
  ReadLn(F.cod);
  If (F.cod<>-1) Then
    Begin
      Write('Ingrese nota: ');
      ReadLn(F.nota);
    End;
End;

Procedure cargarFinal(Var L: lista; F: final);

Var 
  nue: lista;
Begin
  new(nue);
  nue^.data := F;
  nue^.sig := L;
  L := nue;
End;

Procedure cargarFinales(Var L: lista);

Var 
  F: final;
Begin
  leerFinal(F);
  While (F.cod<>-1) Do
    Begin
      cargarFinal(L,F);
      leerFinal(F);
    End;
End;

Procedure leerAlumno (Var Al: alumno);

Begin
  Write('Ingrese legajo de alumno: ');
  ReadLn(Al.leg);
  If (Al.leg<>0) Then
    Begin
      Write('Ingrese dni: ');
      ReadLn(Al.dni);
      Write('Ingrese anio de ingreso: ');
      ReadLn(Al.ing);
      Al.finales := Nil;
      cargarFinales(Al.finales);
    End;
End;

Procedure agregarAlumno(Var A: arbol; Al: alumno);

Begin
  If (A=Nil) Then
    Begin
      new(A);
      A^.data := Al;
      A^.HI := Nil;
      A^.HD := Nil;
    End
  Else If (Al.leg <= A^.data.leg) Then
         agregarAlumno(A^.HI,Al)
  Else
    agregarAlumno(A^.HD,Al);
End;

Procedure cargarArbol(Var A: arbol);

Var 
  Al: alumno;
Begin
  leerAlumno(Al);
  While (Al.leg<>0) Do
    Begin
      agregarAlumno(A,Al);
      leerAlumno(Al);
    End;
End;

Procedure imprimirFinales(L: lista);
Begin
  If (L<>Nil) Then
    Begin
      WriteLn('********************');
      WriteLn('Codigo de materia: ', L^.data.cod);
      WriteLn('Nota de final: ',L^.data.nota);
      imprimirFinales(L^.sig);
    End;
End;

Procedure imprimirArbol(A: arbol);
Begin
  If (A<>Nil) Then
    Begin
      imprimirArbol(A^.HI);
      WriteLn('Numero de legajo ', A^.data.leg);
      WriteLn('DNI alumno ',A^.data.dni);
      WriteLn('Anio de ingreso ', A^.data.ing);
      imprimirFinales(A^.data.finales);
      imprimirArbol(A^.HD);
    End;
End;

Procedure impresionLegInferiores(A: arbol; leg: Integer);
Begin
  If (A<>Nil) Then
    Begin
      impresionLegInferiores(A^.HI,leg);
      If (A^.data.leg<leg) Then
        Begin
          writeln('DNI: ',A^.data.dni);
          writeln('Anio de ingreso: ',A^.data.ing);
          impresionLegInferiores(A^.HD, leg);
        End;
    End;
End;

Procedure imprimirSegunLegajo(A:arbol);

Var 
  leg: integer;
Begin
  write('Ingrese numero de legajo: ');
  ReadLn(leg);
  impresionLegInferiores(A,leg);
End;

Procedure legajoMayor(A: arbol);

Function legajoMax(A: arbol): integer;
Begin
  If (A^.HD <>Nil) Then
    legajoMax := legajoMax(A^.HD)
  Else
    legajoMax := A^.data.leg;
End;

Begin
  writeln('El legajo mayor es ',legajoMax(A));
End;

Procedure dniMaximo (A: arbol);

Procedure dniMax (A:arbol ; Var max: integer);
Begin
  If (A<>Nil) Then
    Begin
      If (A^.data.dni>max) Then
        max := A^.data.dni;
      dniMax(A^.HI,max);
      dniMax(A^.HD,max);
    End;
End;

Var 
  max: integer;
Begin
  max := 0;
  dniMax(A,max);
  Writeln('El dni mas grande es: ', max);
End;

Procedure cantLegajosImpar(A: arbol);

Function cantImpares(A:arbol): Integer;
Begin
  If (A<>Nil) Then
    Begin
      If (A^.data.leg Mod 2 <> 0) Then
        cantImpares := cantImpares(A^.HI) + cantImpares(A^.HD) + 1
      Else
        cantImpares := cantImpares(A^.HI) + cantImpares(A^.HD);
    End
  Else
    cantImpares := 0;
End;

Begin
  Writeln('Hay ',cantImpares(A),' legajos impares');
End;

Var 
  A: arbol;
Begin
  cargarArbol(A);
  // imprimirArbol(A);
  // imprimirSegunLegajo(A);
  // legajoMayor(A);
  dniMaximo(A);
  cantLegajosImpar(A);
End.


// e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
// legajo impar.
// e. Un módulo que reciba la estructura generada en a. y retorne el legajo y el promedio del
// alumno con mayor promedio.
