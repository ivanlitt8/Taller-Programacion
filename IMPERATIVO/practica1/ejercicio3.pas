
// Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
// diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción,
// 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje
// promedio otorgado por las críticas.
// Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
// a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
// género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
// código de la película -1.
// b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
// obtenido entre todas las críticas, a partir de la estructura generada en a)..
// c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
// métodos vistos en la teoría.
// d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
// del vector obtenido en el punto c).

Program ejercicio3;

Const 
  dimF = 8;

Type 
  rango = 1..dimF;
  peli = Record
    cod : integer;
    gen: rango;
    punt: real;
  End;

  lista = ^nodo;
  nodo = Record
    data: peli;
    sig: lista;
  End;

  vector = array [rango] Of lista;
  vectorCod = array [rango] Of integer;

Procedure leerPeli(Var P: peli);
Begin
  write('Ingrese codigo de pelicula: ');
  readln(P.cod);
  If (P.cod<>-1) Then
    Begin
      write('Ingrese genero de pelicula: ');
      readln(P.gen);
      write('Ingrese puntaje promedio de pelicula: ');
      readln(P.punt);
    End;
End;

Procedure cargarEnLista(Var L: lista; P: peli);

Var 
  nue, actual: lista;
Begin
  new(nue);
  nue^.data := P;
  nue^.sig := Nil;
  If (L = Nil) Then
    L := nue
  Else
    Begin
      actual := L;
      While actual^.sig <> Nil Do
        actual := actual^.sig;
      actual^.sig := nue;
    End;
End;


Procedure cargarPeliculas(Var V: vector);

Var 
  P: peli;
Begin
  leerPeli(P);
  While (P.cod<>-1) Do
    Begin
      cargarEnLista(V[P.gen],P);
      leerPeli(P);
    End;
End;

Procedure imprimirPeliculas(V: vector);

Var 
  i: rango;
  aux: lista;
Begin
  For i:= 1 To dimF Do
    Begin
      aux := V[i];
      If (aux<>Nil) Then
        Begin
          writeln('Genero: ',i);
          While (aux<>Nil) Do
            Begin
              writeln('Codigo de pelicula: ',aux^.data.cod);
              writeln('Genero de pelicula: ',aux^.data.gen);
              writeln('Puntaje promedio de pelicula: ',aux^.data.punt:4:2);
              aux := aux^.sig;
            End;
        End;
    End;
End;

Procedure inicializVectCod(Var VC: vectorCod);

Var 
  i: rango;
Begin
  For i:= 1 To dimF Do
    Begin
      VC[i] := -1;
    End;
End;

Procedure codPeliculasMaxPuntaje(V: vector; Var VC: vectorCod);

Var 
  i: rango;
  puntMax: real;
  codMax: integer;
Begin
  For i:= 1 To dimF Do
    Begin
      puntMax := 0;
      codMax := -1;
      While (V[i]<>Nil) Do
        Begin
          If (V[i]^.data.punt>puntMax) Then
            Begin
              puntMax := V[i]^.data.punt;
              codMax := V[i]^.data.cod;
            End;
          V[i] := V[i]^.sig;
        End;
      VC[i] := codMax;
    End;
End;

Procedure imprimirVectorCodigos(VC: vectorCod);

Var 
  i: rango;
Begin
  For i:= 1 To dimF Do
    Begin
      If (VC[i]<>-1) Then
        writeln('Codigo de pelicula con puntaje maximo en genero ',i,': ',VC[i]);
    End;
End;

Procedure inicializVectPelis(Var V: vector);

Var 
  i: rango;
Begin
  For i:= 1 To dimF Do
    V[i] := Nil;
End;

Procedure ordenarVectorCodigos(Var VC:vectorCod);

Var 
  i,j: integer;
  actual: integer;
Begin
  For i:= 2 To dimF Do
    Begin
      actual := VC[i];
      j := i - 1;
      While (j>0) And (VC[j]>actual) Do
        Begin
          VC[j+1] := VC[j];
          j := j-1;
        End;
      VC[j+1] := actual;
    End;
End;

Procedure imprimirVectorOrdenado(VC: vectorCod);

Var 
  i: rango;
Begin
  Writeln('** Codigos ordenados **');
  For i:= 1 To dimF Do
    If (VC[i]<>-1) Then
      Writeln(VC[i]);
End;

Var 
  V: vector;
  VC: vectorCod;
Begin
  inicializVectPelis(V);
  inicializVectCod(VC);
  cargarPeliculas(V);
  imprimirPeliculas(V);
  codPeliculasMaxPuntaje(V,VC);
  imprimirVectorCodigos(VC);
  ordenarVectorCodigos(VC);
  imprimirVectorOrdenado(VC);
End.
