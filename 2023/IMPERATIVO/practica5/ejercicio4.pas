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
    // tipo: String;
  End;

  lista = ^nodo1;
  nodo1 = Record
    data: reclamo;
    sig: lista;
  End;

  registo = Record
    historial: lista;
    cant: integer;
    dni: integer;
  End;

  arbol = ^nodo2;
  nodo2 = Record
    data: registo;
    HI: arbol;
    HD: arbol;
  End;

  codigos = Record
    cod: integer;
  End;

  listaCod = ^nodo3;
  nodo3 = Record
    data: codigos;
    sig: listaCod;
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
      // write('Ingrese tipo: ');
      // ReadLn(R.tipo);
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
      A^.data.dni := R.dni;
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
      // writeln('Tipo: ',L^.data.tipo);
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

Function contarReclamos(A: arbol; dni: Integer): Integer;
Begin
  If (A <> Nil) Then
    Begin
      If (A^.data.dni = dni)Then
        contarReclamos := A^.data.cant
      Else If (A^.data.dni < dni) Then
             contarReclamos := contarReclamos(A^.HD,dni)
      Else
        contarReclamos := contarReclamos(A^.HI,dni);
    End
  Else
    contarReclamos := 0;
End;

Procedure cantidadReclamosDNI(A:arbol);

Var 
  dni: integer;
Begin
  Write('Ingrese DNI: ');
  ReadLn(dni);
  writeln('La cantidad de reclamos de este dni es: ',contarReclamos(A,dni));
End;

Function contarCant(A: arbol; dni1,dni2: integer): integer;
Begin
  If (A<>Nil) Then
    Begin
      If (A^.data.dni >= dni1)Then
        Begin
          If (A^.data.dni <= dni2)Then
            contarCant := contarCant(A^.HI,dni1,dni2) + contarCant(A^.HD,dni1,dni2) + A^.data.cant
          Else
            contarCant := contarCant(A^.HI,dni1,dni2);
        End
      Else
        contarCant := contarCant(A^.HD,dni1,dni2);
    End
  Else
    contarCant := 0;
End;

Procedure cantidadReclamosEntreDNI(A: arbol);

Var 
  dni1,dni2,aux: integer;
Begin
  write('Ingrese DNI 1: ');
  readln(dni1);
  write('Ingrese DNI 2: ');
  readln(dni2);
  If (dni1>dni2)Then
    Begin
      aux := dni1;
      dni1 := dni2;
      dni2 := aux;
    End;
  writeln('La cantidad de reclamos entre estos dni es: ', contarCant(A,dni1,dni2));
End;

Procedure imprimirLista(L: listaCod);
Begin
  While (L<>Nil) Do
    Begin
      writeln('Codigo: ',L^.data.cod);
      writeln('  /////////////  ');
      L := L^.sig;
    End;
End;

Procedure agregarAListaCodigos(Var L: listaCod; C: integer);

Var 
  nue: listaCod;
Begin
  new(nue);
  nue^.data.cod := C;
  nue^.sig := L;
  L := nue;
End;

Procedure verificacionAnio(L: lista ; Var LC: listaCod ; anio: integer);
Begin
  While (L<>Nil) Do
    Begin
      If (L^.data.anio = anio) Then
        agregarAListaCodigos(LC,L^.data.cod);
      L := L^.sig;
    End;
End;

Procedure cargarLista(A: arbol; Var L: listaCod ; anio:integer);
Begin
  If (A <> Nil) Then
    Begin
      cargarLista(A^.HI,L,anio);
      verificacionAnio(A^.data.historial,L,anio);
      cargarLista(A^.HD,L,anio);
    End;
End;

Procedure codigosPorAnio(A: arbol);

Var 
  L: listaCod;
  anio: integer;
Begin
  L := Nil;
  write('Ingrese anio: ');
  readln(anio);
  cargarLista(A,L,anio);
  imprimirLista(L);
End;

Var 
  A: arbol;
Begin
  A := Nil;
  cargarArbol(A);
  imprimirArbol(A);
  // cantidadReclamosDNI(A);
  // cantidadReclamosEntreDNI(A);
  codigosPorAnio(A);
End.
