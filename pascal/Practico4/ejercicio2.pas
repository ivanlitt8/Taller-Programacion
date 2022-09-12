// Un cine posee la lista de películas que proyectará durante el mes de octubre. De cada
// película se conoce: código de película, código de género (1: acción, 2: aventura, 3: drama,
// 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado
// por las críticas. Implementar un programa que contenga:

// a.	Un módulo que lea los datos de películas y los almacene ordenados por código de película
// y agrupados por código de género, en una estructura de datos adecuada. La lectura finaliza
// cuando se lee el código de película -1. 

// b.	Un módulo que reciba la estructura generada en el punto a y retorne una estructura de datos
// donde estén todas las películas almacenadas ordenadas por código de película.


Program ejercicio2;

Const 
  dimF = 8;

Type 
  rango = 1..dimF;
  pelicula = Record
    codigo: Integer;
    genero: rango;
    puntaje: real;
  End;

  lista = ^nodo;
  nodo = Record
    data: pelicula;
    sig: lista;
  End;

  arbol = ^nodoA;
  nodoA = Record
    data: pelicula;
    hi: arbol;
    hd: arbol;
  End;

  vectGen = array [rango] Of lista;

Procedure cargarPeliculas(Var V:vectGen);


Procedure leerPelicula(Var P:pelicula);
Begin
  Writeln('Ingrese codigo de pelicula: ');
  ReadLn(P.codigo);
  If (P.codigo<>-1)Then
    Begin
      writeln('Ingrese genero de pelicula:');
      readln(P.genero);
      writeln('Ingrese puntaje');
      ReadLn(P.puntaje);
    End;
End;


Procedure inicializVect(Var V:vectGen);

Var 
  i: Integer;
Begin
  For i:= 1 To dimF Do
    V[i] := Nil;
End;

Procedure insertarOrdenado (Var L:lista; P:pelicula);

Var 
  nue: lista;
  act,ant: lista;
Begin
  new(nue);
  nue^.data := P;
  act := L;
  ant := L;
  While (act<>Nil) And (P.codigo < act^.data.codigo ) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (act=ant) Then
    L := nue
  Else
    ant^.sig := nue;
  nue^.sig := act;
End;


Var 
  P: pelicula;
Begin
  inicializVect(V);
  leerPelicula(P);
  While (P.codigo<>-1) Do
    Begin
      insertarOrdenado(V[P.genero],P);
      leerPelicula(P);
    End;
End;

Procedure merge(Var A:arbol; V:vectGen);

Procedure minimo(Var V:vectGen; Var minPeli:pelicula);

Var i, indiceMin: Integer;
Begin
  minPeli.codigo := 999;
  For i:=1 To dimF Do
    If (V[i] <> Nil) And (V[i]^.data.codigo <= minPeli.codigo) Then
      Begin
        indiceMin := i;
        minPeli := V[i]^.data;
      End;

  If (minPeli.codigo <> 999) Then
    V[indiceMin] := V[indiceMin]^.sig;

End;

Procedure   cargarEnArbol( Var A:arbol; P:pelicula);
Begin
  If (A=Nil)Then
    Begin
      new(A);
      A^.data := P;
      A^.hi := Nil;
      A^.hd := Nil;
    End
  Else
    Begin
      If (P.codigo < A^.data.codigo)Then
        cargarEnArbol(A^.hi,P)
      Else
        cargarEnArbol(A^.hd,P);
    End;
End;

Var 
  minPeli: pelicula;
Begin
  A := Nil;
  minimo(v, minPeli);
  While (minPeli.codigo <> 999) Do
    Begin
      cargarEnArbol(A, minPeli);
      minimo(v, minPeli);
    End;
End;

Procedure impresionArbol (A:arbol);
Begin
  If (A<>Nil)Then
    Begin
      impresionArbol(A^.hi);
      Writeln('-Codigo Pelicula: ',A^.data.codigo);
      Writeln('-Genero Pelicula: ',A^.data.genero);
      Writeln('-Puntaje Pelicula: ',A^.data.genero);
      Writeln('------------------------');
      impresionArbol(A^.hd);
    End;
End;

Var 
  V: vectGen;
  A: arbol;
Begin
  cargarPeliculas(V);
  merge(A,V);
  impresionArbol(A);
End.
