// 4. Una oficina requiere el procesamiento de los reclamos de las personas. De cada reclamo
// se lee código, DNI de la persona, año y tipo de reclamo. La lectura finaliza con el código de
// igual a -1. Se pide:
// a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI
// se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.
// b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
// reclamos efectuados por ese DNI.
// c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
// reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.
// d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
// los reclamos realizados en el año recibido.

Program ejercicio4;

Type 


  reclamo = Record
    cod: Integer;
    dni: Integer;
    anio: Integer;
    tipo: String;
  End;

  lista = ^nodo1;
  nodo1 = Record
    data: reclamo;
    sig: lista;
  End;

  registo = Record
    historial: lista;
    cant: integer;
  End;

  arbol = ^nodo2;
  nodo2 = Record
    data : registo;
    HI: arbol;
    HD: arbol;
  End;

Procedure leerReclamo(Var R:reclamo);
Begin
  write('Ingrese codigo de reclamo: ');
  ReadLn(R.cod);
  If (R.cod<>-1) Then
    Begin
      write('Ingrese DNI de persona: ');
      ReadLn(R.dni);
      write('Ingrese anio de reclamo: ');
      ReadLn(R.anio);
      write('Ingrese tipo: ');
      ReadLn(R.tipo);
      writeln('  ++ RECLAMO LEIDO ++  ');
    End;
End;

Procedure agregarALista(Var L: lista; R:reclamo);

Var 
  nue: lista;
Begin
  new(nue);
  nue^.data := R;
  nue^.sig := L;
  L := nue;
End;

Procedure agregarReclamo(Var A:arbol; R: reclamo);
Begin
  If (A=Nil)Then
    Begin
      new(A);
      A^.data.historial := Nil;
      A^.data.cant := 1;
      A^.HI := Nil;
      A^.HD := Nil;
      agregarALista(A^.data.historial,R);
    End
  Else
    Begin
      If (A^.data.historial^.data.dni < R.dni) Then
        agregarReclamo(A^.HD,R)
      Else If (A^.data.historial^.data.dni > R.dni) Then
             agregarReclamo(A^.HI,R)
      Else
        Begin
          agregarALista(A^.data.historial,R);
          A^.data.cant := A^.data.cant + 1;
        End;
    End;
End;

Procedure cargarArbol(Var A: arbol);

Var 
  R: reclamo;
Begin
  leerReclamo(R);
  While (R.cod<>-1) Do
    Begin
      agregarReclamo(A,R);
      leerReclamo(R);
    End;
End;

Procedure imprimirLista(L: lista);
Begin
  While (L<>Nil) Do
    Begin
      writeln('Codigo de reclamo: ',L^.data.cod);
      writeln('DNI persona: ',L^.data.dni);
      writeln('Anio reclamo: ',L^.data.anio);
      writeln('Tipo: ',L^.data.tipo);
      writeln('----------------');
      L := L^.sig;
    End;
End;

Procedure imprimirArbol(A:arbol);
Begin
  If (A<>Nil) Then
    Begin
      imprimirArbol(A^.HI);
      writeln('  *************  ');
      writeln('Cantidad de reclamos: ',A^.data.cant);
      writeln('  *************  ');
      imprimirLista(A^.data.historial);
      imprimirArbol(A^.HD);
    End;
End;

Var 
  A: arbol;
Begin
  A := Nil;
  cargarArbol(A);
  imprimirArbol(A);
End.





// a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI
// se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.
