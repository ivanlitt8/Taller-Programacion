// 4.- Una librería requiere el procesamiento de la información de sus productos. De cada producto se conoce
// el código del producto, código de rubro (del 1 al 8) y precio.
// Implementar un programa modularizado que:

// a. Lea los datos de los productos y los almacene ordenados por código de producto y agrupados por rubro,
//     en una estructura de datos adecuada. El ingreso de los productos finaliza cuando se lee el precio 0.

// b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.

// c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que puede haber
//     más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3 es mayor a 30, 
//     almacenar los primeros 30 que están en la lista e ignore el resto.

// d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos métodos
//     vistos en la teoría.

// e. Muestre los precios del vector ordenado.

Program ejercicio4;

Const 
  dimF = 8;
  dimFR = 30;

Type 
  rango = 1..dimF;
  rangoR = 1..dimFR;
  prod = Record
    codP: integer;
    codR: rango;
    precio: real;
  End;

  lista = ^nodo;
  nodo = Record
    data: prod;
    sig: lista;
  End;

  vectProd = array [rango] Of lista;
  vectRub3 = array [rangoR] Of prod;

Procedure cargarProd (Var vp:vectProd);

Procedure iniVect(Var V:vectProd);

Var 
  i: rango;
Begin
  For i:=1 To dimF Do
    V[i] := Nil;
End;


Procedure leerProd (Var P:prod);
Begin
  writeln('Ingrese codigo de producto: ');
  readln(P.codP);
  writeln('Ingrese codigo de rubro: ');
  readln(P.codR);
  writeln('Ingrese precio: ');
  readln(P.precio);
End;

Procedure agregarOrdenado (Var L:lista; P:prod);

Var 
  nue: lista;
  act,ant: lista;
Begin
  new(nue);
  nue^.data := P;
  act := L;
  ant := L;
  While (act<>Nil) And (p.codP < act^.data.codP ) Do
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
  P: prod;
Begin
  iniVect(Vp);
  leerProd(P);
  While (P.precio<>0) Do
    Begin
      agregarOrdenado(Vp[P.codR],P );
      leerProd(P);
    End;
End;


Procedure codigosPorRubro (V:vectProd);


Procedure imprimir (L:lista);
Begin
  While (L<>Nil) Do
    Begin
      Writeln(L^.data.codP);
      L := L^.sig;
    End;
End;


Var 
  i: rango;
Begin
  For i:= 1 To dimF Do
    Begin
      writeln('Codigos de rubro' ,i,': ');
      imprimir(V[i]);
    End;
End;


Procedure almacenarRangoTres (L:lista ;Var V:vectRub3;Var dimL:Integer);
Begin
  dimL := 0;
  While (L<>Nil) And (dimL<dimFR) Do
    Begin
      dimL := (dimL + 1);
      V[dimL] := L^.data;
      L := L^.sig;
    End;
End;

Procedure ordenarVectorPrecio (Var V:vectRub3; dimL:rangoR);

Var 
  i,j,k: rangoR;
  P: prod;
Begin
  For i:=1 To dimL-1 Do
    Begin
      k := i;
      For j:= i+1 To dimL Do
        If V[j].precio < V[k].precio Then
          k := j;
      P := V[k];
      V[k] := V[i];
      V[i] := P;
    End;
  WriteLn('vector ordenado por precio');
  For i:=1 To dimL Do
    writeln(V[i].precio:2:1);

End;



Var 
  V: vectProd;
  Vr3: vectRub3;
  dimL: Integer;
Begin
  cargarProd(V);
  codigosPorRubro(V);
  almacenarRangoTres(V[3],Vr3,dimL);
  ordenarVectorPrecio(Vr3,dimL);
End.
