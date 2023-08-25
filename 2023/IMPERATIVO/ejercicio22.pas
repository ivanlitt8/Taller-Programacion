
Program ejercicio22;

Const 
  corte = 11111;
  dimF = 36;

Type 
  rangoMaterias = 1..dimF;
  cadena15 = String[15];

  vector_nota = array [1..dimF] Of Integer;

  alumno = Record
    apellido: cadena15;
    nro_alumno: Integer;
    anio_ingreso: Integer;
    cantMateriasApropadas: rangoMaterias;
    nota: vector_nota;
  End;

  lista = ^nodo;
  nodo = Record
    dato: alumno;
    sig: lista;
  End;

{------------------------------------------------------}

Procedure agregarAdelante (Var L:lista; a:alumno);

Var 
  nue: Lista;
Begin
  New(nue);
  nue^.dato := a;
  nue^.sig := L;
  L := nue;
End;
{------------------------------------------------------}

Procedure leerVector (Var vc: vector_nota; dimL: Integer);

Var 
  i,nota: Integer;
Begin
  For i:=1 To dimL Do
    Begin
      WriteLn('nota ',i,' :');
      readln(nota);
      vc[i] := nota;
    End;
End;
{------------------------------------------------------}

Procedure leerDatos (Var a: alumno);
Begin
  WriteLn('---------------------------');
  writeln('numero de alumno: ');
  Readln(a.nro_alumno);
  writeln('apellido: ');
  readln(a.apellido);
  writeln('anio de ingreso: ');
  Readln(a.anio_ingreso);
  writeln('cantidad de materias aprobadas: ');
  Readln(a.cantMateriasApropadas);
  leerVector(a.nota,a.cantMateriasApropadas);
End;
{------------------------------------------------------}

Procedure cargarDatos (Var l: lista);

Var a: alumno;
Begin
  Repeat
    leerDatos(a);
    agregarAdelante(l,a);
  Until (a.nro_alumno = corte)
End;
{------------------------------------------------------}

Function calcularPromedio (v: vector_nota; dimL: Integer): Real;

Var 
  i,total: Integer;
Begin
  total := 0;
  For i:= 1 To dimL Do
    total := total + v[i];
  calcularPromedio := (total / dimL);
End;
{------------------------------------------------------}

Procedure IncisoB (l: lista);
Begin
  While (l <> Nil) Do
    Begin
      writeln('el alumno con el numero: ',l^.dato.nro_alumno,' con promedio: ',calcularPromedio(l^.dato.nota,l^.dato.
              cantMateriasApropadas): 4: 2);
      l := l^.sig;
      WriteLn('-------------------------------');
    End;
End;
{------------------------------------------------------}

Var 
  l: lista;
Begin
  l := Nil;
  cargarDatos(l);
  IncisoB(l)
End.
