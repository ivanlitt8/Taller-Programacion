// Netflix ha publicado la lista de películas que estarán disponibles durante el mes de diciembre de 2022.
// De cada película se conoce: código de película, código de género (1: acción, 2: aventura, 3: drama,
// 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas.
// Implementar un programa modularizado que:

//     a. Lea los datos de películas y los almacene por orden de llegada y agrupados por código de género,
//     en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de la película -1.
//     b. Una vez almacenada la información, genere un vector que guarde, para cada género, el código de 
//     película con mayor puntaje obtenido entre todas las críticas.
//     c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos métodos
//     vistos en la teoría.
//     d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el código de película
//     con menor puntaje.

Program ejercicio3;

Type 
  rango = 1..7;

  pel = Record
    codP: integer;
    codG: rango;
    puntaje: real;
  End;

  lista = ^nodo;
  nodo = Record
    data: pel;
    sig: lista;
  End;

  vectPel = array[rango] Of lista ;
  vectorCodigos = array[rango] Of pel;


Procedure maxPuntajePorGenero(V:vectPel; Var VectCod:vectorCodigos);


Procedure maximo(L:Lista; Var codMax :integer; Var max:real);
Begin
  max := 0;
  While (L<>Nil) Do
    Begin
      If (L^.data.puntaje > max) Then
        Begin
          max := L^.data.puntaje;
          codMax := L^.data.codP;
        End;
      L := L^.sig;
    End;
End;

Var 
  i: rango;
  codMax: integer;
  max: real;
Begin
  For i:=1 To 7 Do
    Begin
      maximo(V[i],codMax,max);
      VectCod[i].codP := codMax;
      VectCod[i].puntaje := max;
    End;
  For i:= 1 To 7 Do
    Begin
      writeln(VectCod[i].codP,'-----------',VectCod[i].puntaje:2:1)
    End;
End;




Procedure cargarEnLista(Var V: vectPel);

Procedure leerPelicula(Var P:pel);
Begin
  writeln('Codigo pelicula');
  readln(P.codP);
  If (P.codP<>-1) Then
    Begin
      writeln('Codigo genero');
      readln(P.codG);
      writeln('Puntaje promedio obtenido');
      readln(P.puntaje);
    End;
End;

Procedure inicializVect (Var V:vectPel);

Var 
  i: rango;
Begin
  For i:=1 To 7 Do
    Begin
      V[i] := Nil;
    End;
End;


Procedure InsertarVector (P:pel; Var L:lista);

Var 
  nue: Lista;
Begin
  new(nue);
  nue^.data := P;
  nue^.sig := Nil;
  If L=Nil Then
    L := nue
  Else
    L^.sig := nue;
End;

Procedure imprimirLista(V:vectPel);

Var 
  i: rango;
  L: lista;
Begin
  For i:=1 To 7 Do
    Begin
      L := V[i];
      WriteLn('----------------- Peliculas genero numero ',i,': ');
      While (L<>Nil) Do
        Begin
          WriteLn('Pelicula Codigo: ',L^.data.codP,' - Puntaje: ',L^.data.puntaje:2:1);
          L := L^.sig;
        End;
    End;
End;


Var 
  P: pel;
Begin
  inicializVect(V);
  leerPelicula(P);
  While (P.codP<>-1) Do
    Begin
      InsertarVector(P, V[P.codG]);
      leerPelicula(P);
    End;
  imprimirLista(V);
End;


Var 
  V: vectPel;
  Vc: vectorCodigos;
Begin
  cargarEnLista(V);
  maxPuntajePorGenero(V,Vc);
  //ordenarPorPuntaje(Vc);
End.
