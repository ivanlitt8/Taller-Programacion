
Program ejercicio1;

Const 
  dimF = 36;
  corte = 11111;

Type 
  rango = 1..dimF;
  vectMaterias = array [rango] Of integer;
  alumno = Record
    nro: integer;
    ingreso: integer;
    cant: rango;
    materias: vectMaterias;
  End;
  lista = ^nodo;
  nodo = Record
    data: alumno;
    sig: lista;
  End;

Procedure leerMaterias(Var V: vectMaterias; cant: integer);

Var 
  i,nota: integer;
Begin
  For i:=1 To cant Do
    Begin
      WriteLn('Ingrese nota de materia ', i);
      readln(nota);
      V[i] := nota;
    End;
End;

Procedure leerAlumno (Var A:alumno);
Begin
  writeln('Ingrese numero de alumno: ');
  readln(A.nro);
  writeln('Ingrese anio de ingreso: ');
  readln(A.ingreso);
  writeln('Ingrese cantidad de materias: ');
  readln(A.cant);
  leerMaterias(A.materias,A.cant);
End;

Procedure cargarAlumno(Var L:lista; A:alumno);

Var 
  nue: lista;
Begin
  new(nue);
  nue^.data := A;
  nue^.sig := L;
  L := nue;
End;

Function calcularPromedio (V: vectMaterias; dimL: Integer): Real;

Var 
  i,total: Integer;
Begin
  total := 0;
  For i:= 1 To dimL Do
    total := total + V[i];
  calcularPromedio := (total / dimL);
End;

Procedure imprimirLista(L: lista);

Begin
  While (L<>Nil) Do
    Begin
      writeln('El promedio del alumno numero: ',L^.data.nro,' tiene un promedio de: ',calcularPromedio(L^.data.materias,
              L^.data
              .cant): 4: 2);
      L := L^.sig;
    End;
End;

Procedure cargarLista(Var L:lista);

Var 
  A: alumno;
Begin
  Repeat
    leerAlumno(A);
    cargarAlumno(L,A);
  Until (A.nro = corte);
End;

Var 
  L: lista;
Begin
  L := Nil;
  cargarLista(L);
  imprimirLista(L);
End.
