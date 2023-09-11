// Realizar el punto a) del ejercicio anterior, pero sabiendo que todos los reclamos de un
// mismo DNI se leen de forma consecutiva (no significa que vengan ordenados los DNI).


// " a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI
// se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó."

Program ejercicio5;

Type 
  str = string[20];
  reclamo = Record
    cod: integer;
    dni: integer;
    anio: integer;
  End;

  lista = ^nodoR;
  nodoR = Record
    data: reclamo;
    sig: lista;
  End;

  persona = Record
    dni: integer;
    reclamos: lista;
    cant: integer;
  End;

  arbol = ^nodoP;
  nodoP = Record
    data: persona;
    HI: arbol;
    HD: arbol;
  End;


Procedure agregarReclamo ( Var L:lista; R:reclamo );

Var 
  nue: lista;
Begin
  new(nue);
  nue^.data := R;
  nue^.sig := L;
  L := nue;
End;

Procedure agregarPersona (Var A:arbol; P:persona);
Begin
  If (A = Nil) Then
    Begin
      new(a);
      A^.data.dni := P.dni;
      A^.data.reclamos := Nil;
      A^.data.reclamos := P.reclamos;
      A^.data.cant := P.cant;
      A^.HI := Nil;
      A^.HD := Nil;
    End
  Else If (A^.data.dni  >= P.dni) Then
         agregarPersona(A^.HI,P)
  Else
    agregarPersona(A^.HD,P);
End;

Procedure leerReclamo (Var R:reclamo);
Begin
  write('Ingrese el  codigo: ');
  readln(R.cod);
  If (R.cod <> -1 ) Then
    Begin
      write('Ingrese el dni: ');
      readln(r.dni);
      write('Ingrese el anio: ');
      readln(r.anio);
      writeln();
    End;
End;

Procedure cargarReclamosPorDNI (Var A:arbol);

Var 
  P: persona;
  R: reclamo;
Begin
  leerReclamo(R);
  While (R.cod <> -1 ) Do
    Begin
      P.dni := R.dni;
      P.reclamos := Nil;
      P.cant := 0;
      While (R.cod <> -1) And (p.dni = R.dni) Do
        Begin
          agregarReclamo(P.reclamos, R);
          P.cant := P.cant +1;
          leerReclamo(R);
        End;
      agregarPersona(A,P);
    End;
End;

Procedure imprimirLista (L:lista);
Begin
  If (L <> Nil)  Then
    Begin
      writeln('Codigo: ', L^.data.cod, '| ', 'Anio: ', L^.data.anio, ' | ');
      writeln();
      imprimirLista(L^.sig);
    End;
End;

Procedure imprimirArbol (A:arbol);

Begin
  If (A <> Nil) Then
    Begin
      imprimirArbol (A^.HI);
      writeln('DNI: ', A^.data.dni, ' | ', 'Cantidad de reclamos: ',A^.data.cant);
      writeln('Lista de los reclamos realizados: ');
      imprimirLista(A^.data.reclamos);
      writeln();
      imprimirArbol(a^.HD);
    End;
End;

Var 
  A: arbol;
Begin
  A := Nil;
  cargarReclamosPorDNI(A);
  imprimirArbol(A);
End.
